/obj/machinery/oven/range/hl13
	idle_power_usage = 0.0
	active_power_usage = 0.0

/obj/machinery/oven/range/hl13/burner
	name = "Stove"
	desc = "A stove and oven."
	icon_state = "range_off"

/obj/machinery/oven/range/hl13/burner/Initialize(mapload)
	. = ..()
	var/obj/item/reagent_containers/cup/soup_pot/mapload_container
	if(mapload)
		mapload_container = new(loc)

	AddComponent(/datum/component/stove, container_x = -6, container_y = 14, spawn_container = mapload_container)

/obj/item/reagent_containers/cup/hl13/frying_pan
	name = "Frying Pan"
	icon = 'hl13/icons/obj/soup_pot.dmi'
	icon_state = "frying_pan"
	volume = 5
	hitsound = 'hl13/sound/weapons/melee/pan_hit_sound.ogg'
	force = 12
	throwforce = 12
	throw_speed = 2
	throw_range = 7
	var/obj/item/item_on_pan
	var/datum/looping_sound/grill/grill_loop
	var/on_heat_source = FALSE

/obj/item/reagent_containers/cup/hl13/frying_pan/Initialize(mapload)
	. = ..()
	grill_loop = new(src, FALSE)

/obj/item/reagent_containers/cup/hl13/frying_pan/Destroy()
	QDEL_NULL(grill_loop)
	return ..()

/obj/item/reagent_containers/cup/hl13/frying_pan/proc/on_heat_source(cooking_temp)
	if(cooking_temp)
		START_PROCESSING(SSobj, src)
	else
		STOP_PROCESSING(SSobj, src)
	on_heat_source = cooking_temp
	update_pan_audio()

/obj/item/reagent_containers/cup/hl13/frying_pan/proc/update_pan_audio()
	if(on_heat_source && item_on_pan)
		grill_loop.start()
	else
		grill_loop.stop()

/obj/item/reagent_containers/cup/hl13/frying_pan/attackby(obj/item/I, mob/user, params)
	if(!IS_EDIBLE(I))
		to_chat(user, span_notice("[src] is made for food, and food alone!"))
		return
	if(item_on_pan)
		to_chat(user, span_notice("the [src] is full!"))
		return
	if(user.transferItemToLoc(I, src, silent = FALSE))
		to_chat(user, span_notice("You place [I] on [src]."))
		addToPan(I, user)
	else
		return ..()

/obj/item/reagent_containers/cup/hl13/frying_pan/proc/addToPan(obj/item/item_add_pan, mob/user)
	item_on_pan = item_add_pan
	vis_contents += item_add_pan
	item_add_pan.flags_1 |= IS_ONTOP_1
	item_add_pan.vis_flags |= VIS_INHERIT_PLANE
	SEND_SIGNAL(item_add_pan, COMSIG_ITEM_GRILL_PLACED_ON, user)
	RegisterSignal(item_add_pan, COMSIG_MOVABLE_MOVED, PROC_REF(ItemMoved))
	RegisterSignal(item_add_pan, COMSIG_PARENT_QDELETING, PROC_REF(ItemMoved))
	RegisterSignal(item_add_pan, COMSIG_ITEM_GRILLED, PROC_REF(GrillCompleted))
	update_pan_audio()
	update_appearance()

/obj/item/reagent_containers/cup/hl13/frying_pan/proc/ItemMoved(obj/item/moved_item, atom/OldLoc, Dir, Forced)
	SIGNAL_HANDLER
	ItemRemovedFromPan(moved_item)

/obj/item/reagent_containers/cup/hl13/frying_pan/proc/ItemRemovedFromPan(obj/item/removed_item)
	removed_item.flags_1 &= ~IS_ONTOP_1
	removed_item.vis_flags &= ~VIS_INHERIT_PLANE
	vis_contents -= removed_item
	item_on_pan = null
	UnregisterSignal(removed_item, list(COMSIG_MOVABLE_MOVED, COMSIG_PARENT_QDELETING, COMSIG_ITEM_GRILLED))
	update_pan_audio()

/obj/item/reagent_containers/cup/hl13/frying_pan/proc/GrillCompleted(obj/item/source, atom/grilled_result)
	SIGNAL_HANDLER
	addToPan(grilled_result)

/obj/item/reagent_containers/cup/hl13/frying_pan/process(delta_time)
	SEND_SIGNAL(item_on_pan,COMSIG_ITEM_GRILL_PROCESS, src, delta_time)

/obj/item/reagent_containers/cup/hl13/frying_pan/attack(mob/living/target_mob, mob/living/user, params)
	if (!user.combat_mode)
		return ..()
	else
		var/signal_return = SEND_SIGNAL(src, COMSIG_ITEM_ATTACK, target_mob, user, params)
		if(signal_return & COMPONENT_CANCEL_ATTACK_CHAIN)
			return TRUE
		if(signal_return & COMPONENT_SKIP_ATTACK)
			return

		SEND_SIGNAL(user, COMSIG_MOB_ITEM_ATTACK, target_mob, user, params)

		if(item_flags & NOBLUDGEON)
			return

		if(damtype != STAMINA && force && HAS_TRAIT(user, TRAIT_PACIFISM))
			to_chat(user, span_warning("You don't want to harm other living beings!"))
			return

		if(!force && !HAS_TRAIT(src, TRAIT_CUSTOM_TAP_SOUND))
			playsound(loc, 'sound/weapons/tap.ogg', get_clamped_volume(), TRUE, -1)
		else if(hitsound)
			playsound(loc, hitsound, get_clamped_volume(), TRUE, extrarange = stealthy_audio ? SILENCED_SOUND_EXTRARANGE : -1, falloff_distance = 0)

		target_mob.lastattacker = user.real_name
		target_mob.lastattackerckey = user.ckey

		if(force && target_mob == user && user.client)
			user.client.give_award(/datum/award/achievement/misc/selfouch, user)

		user.do_attack_animation(target_mob)
		target_mob.attacked_by(src, user)

		log_combat(user, target_mob, "attacked", src.name, "(COMBAT MODE: [uppertext(user.combat_mode)]) (DAMTYPE: [uppertext(damtype)])")
		add_fingerprint(user)
