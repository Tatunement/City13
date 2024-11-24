/obj/item/ammo_casing/shotgun/hl13
	name = "shotgun shell"
	desc = "A 12 gauge 7 pellets"
	icon_state = "shotgunshell"
	pellets = 7
	variance = 25
	projectile_type = /obj/projectile/bullet/hl13/shotgun
	hl13_casing_empty = /obj/item/ammo_casing/hl13/casing_empty
	hl13_flag = TRUE

/obj/item/ammo_casing/shotgun/hl13/casing_empty
	icon_state = "shotgunshell"
	name = "spent shotgun shell"
	loaded_projectile = null
