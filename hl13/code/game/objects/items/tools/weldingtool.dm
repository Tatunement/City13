/obj/item/weldingtool/hl13
	name = "welding tool"
	desc = "Standard tool for welding"
	icon = 'hl13/icons/obj/tools.dmi'
	icon_state = "welder"
	inhand_icon_state = "welder"
	worn_icon_state = "welder"
	lefthand_file = 'hl13/icons/mob/inhands/equipment/tools_lefthand.dmi'
	righthand_file = 'hl13/icons/mob/inhands/equipment/tools_righthand.dmi'
	usesound = list('sound/items/welder.ogg', 'sound/items/welder2.ogg')
	drop_sound = 'sound/items/handling/weldingtool_drop.ogg'
	pickup_sound = 'sound/items/handling/weldingtool_pickup.ogg'
	custom_materials = list(/obj/item/stack/sheet/iron/hl13/metal=70)
	activation_sound = 'sound/items/welderactivate.ogg'
	deactivation_sound = 'sound/items/welderdeactivate.ogg'

/obj/item/weldingtool/hl13/power
	name = "combine welder hammer"
	desc = "A tool that alternates between a welding tool and a powerful piston meant for breaking walls."
	icon_state = "jackhammer"
	inhand_icon_state = "jackhammer"
	lefthand_file = 'hl13/icons/mob/inhands/equipment/tools_lefthand.dmi'
	righthand_file = 'hl13/icons/mob/inhands/equipment/tools_righthand.dmi'
	custom_materials = list(/obj/item/stack/sheet/iron/hl13/combine=70)
	w_class = WEIGHT_CLASS_NORMAL
	toolspeed = 0.7

	var/datum/looping_sound/welderhammer/hammer_loop

/obj/item/weldingtool/hl13/power/Initialize(mapload)
	. = ..()
	hammer_loop = new(src)

/obj/item/weldingtool/hl13/power/attack(mob/living/carbon/human/attacked_humanoid, mob/living/user)
	if(tool_behaviour == TOOL_SLEDGEHAMMER)
		icon_state = "jackhammer_on"
		if(!do_after(user, 1 SECONDS, attacked_humanoid))
			return
		wound_bonus = 20
		force = 20
		icon_state = "jackhammer_smash_stop"
		playsound(loc, 'hl13/sound/items/welder_hammer_deconstruct.ogg', 65)
		return ..()
	else
		wound_bonus = 10
		force = 3
		. = ..()


/obj/item/weldingtool/hl13/power/attack_self_secondary(mob/living/user)
	if(tool_behaviour != TOOL_WELDER)
		balloon_alert(user, "Welding tool is still in tool storage!")
		return
	switched_on(user)
	update_appearance()

/obj/item/weldingtool/hl13/power/attack_self(mob/user)
	if(tool_behaviour == TOOL_WELDER)
		icon_state = "jackhammer_on"
		tool_behaviour = TOOL_SLEDGEHAMMER
		switched_off(user)
		balloon_alert(user, "switched to hammer")
	else
		icon_state = "jackhammer"
		tool_behaviour = TOOL_WELDER
		balloon_alert(user, "switched to welding")

/obj/item/weldingtool/hl13/power/tool_use_check(mob/living/user, amount)
	if(tool_behaviour == TOOL_SLEDGEHAMMER)
		return TRUE
	if(!isOn() || !check_fuel())
		to_chat(user, span_warning("[src] has to be on to complete this task!"))
		return FALSE

	if(get_fuel() >= amount)
		return TRUE
	else
		to_chat(user, span_warning("You need more welding fuel to complete this task!"))
		return FALSE

/obj/item/weldingtool/hl13/power/use_tool(atom/target, mob/living/user, delay, amount, volume, datum/callback/extra_checks)
	if(tool_behaviour == TOOL_WELDER)
		AddElement(/datum/element/tool_flash, light_range)
		usesound = list('sound/items/welder.ogg', 'sound/items/welder2.ogg')
		var/mutable_appearance/sparks = mutable_appearance('icons/effects/welding_effect.dmi', "welding_sparks", GASFIRE_LAYER, src, ABOVE_LIGHTING_PLANE)
		target.add_overlay(sparks)
		LAZYADD(update_overlays_on_z, sparks)
		. = ..()
		LAZYREMOVE(update_overlays_on_z, sparks)
		target.cut_overlay(sparks)
	if(tool_behaviour == TOOL_SLEDGEHAMMER)
		RemoveElement(/datum/element/tool_flash, light_range)
		hammer_loop.start()
		delay *= toolspeed
		if(!delay && !tool_start_check(user, amount))
			return
		icon_state = "jackhammer_smash"
		if(delay)
			var/datum/callback/tool_check = CALLBACK(src, PROC_REF(tool_check_callback), user, amount, extra_checks)
			if(!do_after(user, delay, target=target, extra_checks=tool_check))
				icon_state = "jackhammer_on"
				hammer_loop.stop()
				return
		else
			if(extra_checks && !extra_checks.Invoke())
				icon_state = "jackhammer_on"
				hammer_loop.stop()
				return
		if(amount && !use(amount))
			icon_state = "jackhammer_on"
			hammer_loop.stop()
			return
		icon_state = "jackhammer_on"
		hammer_loop.stop()
		return TRUE
