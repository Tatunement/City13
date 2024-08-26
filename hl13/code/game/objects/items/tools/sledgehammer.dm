/obj/item/hl13/sledgehammer
	name = "Sledge Hammer"
	desc = "A large hammer, It can break open most things walls or skulls"
	icon = 'hl13/icons/obj/weapons/melee/sledgehammer.dmi'
	base_icon_state = "Sledgehammer"
	icon_state = "Sledgehammer0"
	worn_icon = 'hl13/icons/mob/clothing/back/sledgehammer.dmi'
	lefthand_file = 'hl13/icons/mob/inhands/equipment/tools_lefthand.dmi'
	righthand_file = 'hl13/icons/mob/inhands/equipment/tools_righthand.dmi'

	usesound = 'hl13/sound/items/hammer_deconstruct.ogg'
	var/datum/looping_sound/sledgehammer/hammer_loop
	slot_flags = list(ITEM_SLOT_SUITSTORE, ITEM_SLOT_BACK)
	force = 5
	throwforce = 12
	throw_speed = 2
	throw_range = 7
	demolition_mod = 1.25
	w_class = WEIGHT_CLASS_HUGE
	custom_materials = list(/obj/item/stack/sheet/hl13/concrete=50,/obj/item/stack/sheet/iron/hl13/metal=20)

	attack_verb_continuous = list("attacks", "bashes", "batters", "bludgeons", "whacks","slægans")
	attack_verb_simple = list("attack", "bash", "batter", "bludgeon", "whack","slægan")
	tool_behaviour = TOOL_SLEDGEHAMMER
	toolspeed = 1
	armor_type = /datum/armor/item_crowbar
	hl13_flag = TRUE

	var/force_unwielded = 5
	var/force_wielded = 17

/obj/item/hl13/sledgehammer/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded=force_unwielded, force_wielded=force_wielded, icon_wielded="[base_icon_state]1")
	hammer_loop = new(src)
/obj/item/hl13/sledgehammer/update_icon_state()
	icon_state = "[base_icon_state]0"
	return ..()
/obj/item/hl13/sledgehammer/use_tool()
	hammer_loop.start()
	. = ..()
	hammer_loop.stop()
