/obj/machinery/hl13/fabricator
	name = "fabricator"
	icon = 'hl13/icons/obj/combine.dmi'
	icon_state = "fabricator"
	density = TRUE
	var/scrap_sheets = 0
	var/combine_sheets = 0
	var/glass_sheets = 0
	var/metal_sheets = 0
	var/plastic_sheets = 0

/obj/machinery/hl13/fabricator/attackby(obj/item/attacking_item, mob/user)
	if(attacking_item == /obj/item/stack/sheet/hl13/scrap_metal)
		var/obj/item/stack/sheet/hl13/scrap_metal/scrap = attacking_item
		scrap_sheets = scrap.amount
		to_chat(user, span_notice("You insert the scrap"))
		del attacking_item


