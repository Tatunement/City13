/obj/item/ammo_box/magazine/hl13/hl4x6mm/
	name = "MP7 magazine (4.6mm)"
	icon_state = "4.6mm-40"
	base_icon_state = "4.6mm"
	ammo_type = /obj/item/ammo_casing/hl13/hl4x6mm
	caliber = CALIBER_46X30MM
	max_ammo = 40

/obj/item/ammo_box/magazine/hl13/hl4x6mm/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state]-[round(ammo_count(), 10)]"
