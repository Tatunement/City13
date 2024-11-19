/obj/item/gun/ballistic/automatic/hl13/ar2
	name = "AR2"
	desc = ""
	icon = 'hl13/icons/obj/weapons/guns/ballistic.dmi'
	righthand_file = 'hl13/icons/mob/inhands/weapons/guns_righthand.dmi'
	lefthand_file = 'hl13/icons/mob/inhands/weapons/guns_lefthand.dmi'
	icon_state = "ar2"
	inhand_icon_state = "mp7"
	w_class = WEIGHT_CLASS_BULKY
	mag_type = /obj/item/ammo_box/magazine/hl13/ar2
	vary_fire_sound = FALSE
	can_suppress = FALSE
	burst_size = 1
	fire_delay = 0
	actions_types = list()
	bolt_type = BOLT_TYPE_OPEN
	fire_sound = 'hl13/sound/weapons/gun/AR2/fire1.ogg'
	dry_fire_sound = 'hl13/sound/weapons/gun/USP/dry_fire.ogg'
	load_sound = 'hl13/sound/weapons/gun/AR2/ar2_reload.ogg'
	rack_sound = 'hl13/sound/weapons/gun/AR2/ar2_reload_rotate.ogg'
	casing_ejector = FALSE
	fire_sound_volume = 90

/obj/item/gun/ballistic/automatic/hl13/ar2/no_mag
	spawnwithmagazine = FALSE

/obj/item/gun/ballistic/automatic/hl13/ar2/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.15 SECONDS)
