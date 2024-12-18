/obj/structure/mineral_door/material_door
	icon_state = null
	openSound = null
	closeSound = null

/obj/structure/mineral_door/material_door/Open()
	isSwitchingStates = TRUE
	playsound(src, openSound, 100, TRUE)
	set_opacity(FALSE)
	set_density(FALSE)
	door_opened = TRUE
	layer = OPEN_DOOR_LAYER
	air_update_turf(TRUE, FALSE)
	update_appearance()
	isSwitchingStates = FALSE

	if(close_delay != -1)
		addtimer(CALLBACK(src, .proc/Close), close_delay)

/obj/structure/mineral_door/material_door/Close()
	if(isSwitchingStates || !door_opened)
		return
	var/turf/T = get_turf(src)
	for(var/mob/living/L in T)
		return
	isSwitchingStates = TRUE
	playsound(src, closeSound, 100, TRUE)
	set_density(TRUE)
	set_opacity(TRUE)
	door_opened = FALSE
	layer = initial(layer)
	air_update_turf(TRUE, TRUE)
	update_appearance()
	isSwitchingStates = FALSE

/obj/structure/mineral_door/material_door/metal_door
	name = "metal door"
	icon = 'hl13/icons/obj/doors/metal_door_2.dmi'
	openSound = 'hl13/sound/door/default_move.ogg'
	closeSound = 'hl13/sound/door/default_stop.ogg'

/obj/structure/mineral_door/material_door/metal_door/north
	icon_state = "metaldoor"

/obj/structure/mineral_door/material_door/metal_door/north_2
	icon_state = "metaldoor2"

/obj/structure/mineral_door/material_door/metal_door/east
	icon_state = "metaldoore"

/obj/structure/mineral_door/material_door/metal_door/east_2
	icon_state = "metaldoore2"

/obj/structure/mineral_door/material_door/metal_door/west
	icon_state = "metaldoorw"

/obj/structure/mineral_door/material_door/metal_door/west_2
	icon_state = "metaldoorw2"

/obj/structure/mineral_door/material_door/wooden_door
	name = "wooden door"
	icon = 'hl13/icons/obj/doors/wooden_door_2.dmi'
	openSound = 'hl13/sound/door/latchunlocked1.ogg'
	closeSound = 'hl13/sound/door/door_wood_close1.ogg'

/obj/structure/mineral_door/material_door/wooden_door/north
	icon_state = "woodendoor"

/obj/structure/mineral_door/material_door/wooden_door/north_2
	icon_state = "woodendoor2"

/obj/structure/mineral_door/material_door/wooden_door/east
	icon_state = "woodendoore"

/obj/structure/mineral_door/material_door/wooden_door/east_2
	icon_state = "woodendoore2"


/obj/structure/mineral_door/material_door/wooden_door/west
	icon_state = "woodendoorw"

/obj/structure/mineral_door/material_door/wooden_door/west_2
	icon_state = "woodendoorw2"
