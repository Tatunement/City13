/obj/item/ammo_box/magazine/hl13/
	icon = 'hl13/icons/obj/weapons/guns/ammo.dmi'
	hl13_flag = TRUE

/obj/item/ammo_box/magazine/hl13/hl9mm/
	name = "USP magazine (9mm)"
	icon_state = "9mm-15"
	base_icon_state = "9mm"
	ammo_type = /obj/item/ammo_casing/hl13/hl9mm
	caliber = CALIBER_9MM
	max_ammo = 15

/obj/item/ammo_box/magazine/hl13/hl9mm/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state]-[round(ammo_count(), 5)]"
