/obj/machinery/hl13/refiner
	name = "Combine refiner"
	icon = 'hl13/icons/obj/combine.dmi'
	icon_state = "refiner_open"
	density = TRUE

/obj/machinery/hl13/refiner/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/stack/sheet/hl13/scrap_metal))
		icon_state = "refiner_closed"
		var/obj/item/stack/sheet/hl13/scrap_metal/scrap = W
		var/obj/item/stack/sheet/hl13/steel_sheet/new_sheet
		new_sheet.amount = scrap.amount
		new new_sheet(src.loc)
		icon_state = "refiner_opened"
		del W


