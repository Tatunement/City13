/obj/item/ammo_casing/hl13/ar2
	caliber = CALIBER_PULSE
	projectile_type = /obj/projectile/bullet/hl13/pulse

/obj/item/ammo_casing/hl13/hl4x6mm
	name = "4.6mm bullet casing"
	desc = "A 4.6mm bullet casing."
	caliber = CALIBER_46X30MM
	projectile_type = /obj/projectile/bullet/hl13/hl4x6mm
	hl13_casing_empty = /obj/item/ammo_casing/hl13/hl4x6mm/casing_empty

/obj/item/ammo_casing/hl13/hl4x6mm/casing_empty
	name = "Spent 4.6mm bullet casing"
	desc = "A spent 4.6mm bullet casing."
	icon_state = "s-casing"
	loaded_projectile = null
