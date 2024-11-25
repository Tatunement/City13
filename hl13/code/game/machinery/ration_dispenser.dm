/obj/machinery/hl13/ration_dispenser
	icon = 'hl13/icons/obj/combine.dmi'
	icon_state = "rationdispenser"

/obj/machinery/hl13/ration_dispenser/Initialize(mapload)
	. = ..()
	if(NORTH)
		pixel_y = 3
	if(EAST)
		pixel_x = 3
	if(WEST)
		pixel_x = -3
