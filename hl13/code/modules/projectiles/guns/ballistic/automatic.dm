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


/obj/item/gun/ballistic/automatic/hl13/mp7
	name = "MP7"
	desc = ""
	icon = 'hl13/icons/obj/weapons/guns/ballistic.dmi'
	righthand_file = 'hl13/icons/mob/inhands/weapons/guns_righthand.dmi'
	lefthand_file = 'hl13/icons/mob/inhands/weapons/guns_lefthand.dmi'
	icon_state = "mp7"
	inhand_icon_state = "mp7"
	w_class = WEIGHT_CLASS_BULKY
	mag_type = /obj/item/ammo_box/magazine/hl13/hl4x6mm
	vary_fire_sound = FALSE
	can_suppress = FALSE
	burst_size = 1
	fire_delay = 0
	actions_types = list()
	bolt_type = BOLT_TYPE_LOCKING
	fire_sound = 'hl13/sound/weapons/gun/MP7/smg1_fire1.ogg'
	dry_fire_sound = 'hl13/sound/weapons/gun/USP/dry_fire.ogg'
	load_sound = 'hl13/sound/weapons/gun/MP7/smg1_reload.ogg'
	load_empty_sound = 'hl13/sound/weapons/gun/USP/mag_insert.ogg'
	eject_sound = 'hl13/sound/weapons/gun/USP/mag_release.ogg'
	eject_empty_sound = 'hl13/sound/weapons/gun/USP/mag_release.ogg'
	rack_sound = 'hl13/sound/weapons/gun/USP/rack_small.ogg'
	lock_back_sound = 'hl13/sound/weapons/gun/USP/lock_small.ogg'
	bolt_drop_sound = 'hl13/sound/weapons/gun/USP/drop_small.ogg'
	fire_sound_volume = 90
	bolt_wording = "slide"

/obj/item/gun/ballistic/automatic/hl13/mp7/no_mag
	spawnwithmagazine = FALSE

/obj/item/gun/ballistic/automatic/hl13/mp7/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.1 SECONDS)

/obj/item/gun/ballistic/automatic/hl13/mp7/luty
	name = "Luty-9mm"
	desc = "AH GOD ITS SO FUCKING UGLY"
	icon_state = "luty"
	mag_type = /obj/item/ammo_box/magazine/hl13/hl9mm/luty
	recoil = 1
	randomspread = 30
