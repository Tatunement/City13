/obj/machinery/hl13/ration_dispenser
	icon = 'hl13/icons/obj/combine.dmi'
	icon_state = "rationdispenser"

/obj/machinery/hl13/ration_dispenser/Initialize(mapload)
	. = ..()
	switch(dir)
		if(NORTH)
			pixel_y = 8
		if(EAST)
			pixel_x = 7
		if(WEST)
			pixel_x = -7
