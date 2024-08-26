/obj/item/crowbar/hl13
	name = "crowbar"
	desc = "A crowbar. This handy tool is useful for lots of things, such as prying floor tiles or opening unpowered doors."
	icon = 'hl13/icons/obj/tools.dmi'
	icon_state = "crowbar"
	inhand_icon_state = "crowbar"
	lefthand_file = 'icons/mob/inhands/equipment/tools_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/tools_righthand.dmi'
	usesound = 'sound/items/crowbar.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	custom_materials = list(/obj/item/stack/sheet/iron/hl13/metal=50)
	drop_sound = 'sound/items/handling/crowbar_drop.ogg'
	pickup_sound = 'sound/items/handling/crowbar_pickup.ogg'
	hitsound = 'hl13/sound/weapons/melee/flesh_impact/flesh_impact_bullet1.ogg'
	force = 10

/obj/item/crowbar/power/hl13
	name = "Combine jaws"
	desc = "A machine made to double as a crowbar and wirecutters"
	icon = 'hl13/icons/obj/tools.dmi'
	icon_state = "jaws"
	inhand_icon_state = "jaws"
	lefthand_file = 'hl13/icons/mob/inhands/equipment/tools_lefthand.dmi'
	righthand_file = 'hl13/icons/mob/inhands/equipment/tools_righthand.dmi'
	w_class = WEIGHT_CLASS_NORMAL
	toolspeed = 0.7
	force_opens = TRUE
	usesound = 'sound/items/jaws_pry.ogg'
	custom_materials = list(/obj/item/stack/sheet/iron/hl13/combine=50)
