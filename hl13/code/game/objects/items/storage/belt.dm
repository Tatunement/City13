/obj/item/storage/belt/hl13
	hl13_flag = TRUE
	icon = 'hl13/icons/obj/clothing/belts.dmi'
	lefthand_file = 'hl13/icons/mob/inhands/equipment/belt_lefthand.dmi'
	righthand_file = 'hl13/icons/mob/inhands/equipment/belt_righthand.dmi'
	worn_icon = 'hl13/icons/mob/clothing/belt.dmi'

/obj/item/storage/belt/hl13/cp_belt
	name = "civil protection belt"
	desc = "Can hold civil protection gear like handcuffs and flashes."
	icon_state = "cp_belt"
	inhand_icon_state = "cp_belt"
	worn_icon_state = "cp_belt"

/obj/item/storage/belt/hl13/cp_belt/Initialize(mapload)
	. = ..()
	atom_storage.max_slots = 5
	atom_storage.max_specific_storage = WEIGHT_CLASS_NORMAL
	atom_storage.set_holdable(list(
		/obj/item/modular_computer/combine_pda,
		/obj/item/melee/baton/security/hl13,
		/obj/item/gun/ballistic/automatic/hl13/usp,
		/obj/item/ammo_box/magazine/hl13/hl9mm,
		)) //todo:Set a whitelist of items that can be holded and add relative sprites


/obj/item/storage/belt/hl13/cp_belt/full/PopulateContents()
	var/static/items_inside = list(
		/obj/item/modular_computer/combine_pda=1,
		/obj/item/melee/baton/security/hl13=1,
		/obj/item/gun/ballistic/automatic/hl13/usp=1,
		/obj/item/ammo_box/magazine/hl13/hl9mm=2,
		)
	generate_items_inside(items_inside,src)
	update_appearance()

/obj/item/storage/belt/hl13/tools
	name = "combine worker toolbelt"
	icon_state = "cmb_worker_belt"
	inhand_icon_state = "cp_belt"
	worn_icon_state = "cp_belt"
	content_overlays = FALSE

/obj/item/storage/belt/hl13/tools/Initialize(mapload)
	. = ..()
	atom_storage.max_slots = 5
	atom_storage.max_specific_storage = WEIGHT_CLASS_NORMAL
	atom_storage.set_holdable(list(
		/obj/item/screwdriver/hl13,
		/obj/item/weldingtool/hl13,
		/obj/item/crowbar/hl13,
		/obj/item/wrench/hl13,
		/obj/item/wirecutters/hl13))

/obj/item/storage/belt/hl13/tools/full/PopulateContents()
	var/static/items_inside = list(
		/obj/item/screwdriver/hl13=1,
		/obj/item/weldingtool/hl13=1,
		/obj/item/crowbar/hl13=1,
		/obj/item/wrench/hl13=1,
		/obj/item/wirecutters/hl13=1
		)
	generate_items_inside(items_inside,src)
	update_appearance()
