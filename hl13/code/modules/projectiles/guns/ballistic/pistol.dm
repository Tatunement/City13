/obj/item/gun/ballistic/automatic/hl13/usp
	name = "HK USP Match"
	desc = ""
	icon = 'hl13/icons/obj/weapons/guns/ballistic.dmi'
	righthand_file = 'hl13/icons/mob/inhands/weapons/guns_righthand.dmi'
	lefthand_file = 'hl13/icons/mob/inhands/weapons/guns_lefthand.dmi'
	icon_state = "usp"
	inhand_icon_state = "usp"
	w_class = WEIGHT_CLASS_SMALL
	mag_type = /obj/item/ammo_box/magazine/hl13/hl9mm/
	vary_fire_sound = FALSE
	can_suppress = FALSE
	burst_size = 1
	fire_delay = 0
	actions_types = list()
	bolt_type = BOLT_TYPE_LOCKING
	fire_sound = 'hl13/sound/weapons/gun/USP/shot.ogg'
	dry_fire_sound = 'hl13/sound/weapons/gun/USP/dry_fire.ogg'
	load_sound = 'hl13/sound/weapons/gun/USP/mag_insert.ogg'
	load_empty_sound = 'hl13/sound/weapons/gun/USP/mag_insert.ogg'
	eject_sound = 'hl13/sound/weapons/gun/USP/mag_release.ogg'
	eject_empty_sound = 'hl13/sound/weapons/gun/USP/mag_release.ogg'
	rack_sound = 'hl13/sound/weapons/gun/USP/rack_small.ogg'
	lock_back_sound = 'hl13/sound/weapons/gun/USP/lock_small.ogg'
	bolt_drop_sound = 'hl13/sound/weapons/gun/USP/drop_small.ogg'
	fire_sound_volume = 90
	bolt_wording = "slide"

/obj/item/gun/ballistic/automatic/hl13/usp/no_mag
	spawnwithmagazine = FALSE

/obj/item/gun/ballistic/automatic/hl13/usp/zip
	name = "Inprovied zip gun"
	internal_magazine = TRUE
	mag_type = /obj/item/ammo_box/magazine/internal/hl13/zip_mag
	icon_state = "zipgun"

/obj/item/gun/ballistic/automatic/hl13/usp/zip/no_mag
	spawnwithmagazine = FALSE
