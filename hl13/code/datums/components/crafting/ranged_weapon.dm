/datum/crafting_recipe/luty
	name = "Luty 9mm"
	tool_behaviors = list(TOOL_WRENCH, TOOL_WELDER, TOOL_WIRECUTTER)
	result = /obj/item/gun/ballistic/automatic/hl13/mp7/no_mag
	reqs = list(
		/obj/item/stack/sheet/iron/hl13/metal = 15,
	)
	time = 15 SECONDS
	category = CAT_WEAPON_RANGED

/datum/crafting_recipe/zip
	name = "Zip Gun"
	tool_behaviors = list(TOOL_SCREWDRIVER)
	result = /obj/item/gun/ballistic/automatic/hl13/usp/zip/no_mag
	reqs = list(
		/obj/item/stack/sheet/iron/hl13/metal = 3,
	)
	time = 10 SECONDS
	category = CAT_WEAPON_RANGED

/datum/crafting_recipe/9mmcasing
	name = "9mm"
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WELDER)
	result = /obj/item/ammo_casing/hl13/hl9mm
	reqs = list(
		/obj/item/ammo_casing/spent = 1,
		/obj/item/stack/sheet/iron/hl13/metal = 1,
		/datum/reagent/fuel = 1,
	)
	time = 1 SECONDS
	category = CAT_WEAPON_RANGED
