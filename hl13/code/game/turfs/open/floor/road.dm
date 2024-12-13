/turf/open/floor/city_floor/cobblestone_road
	icon = 'hl13/icons/turf/floors/road.dmi'
	name = "cobblestone road"
	desc = "Stoney street, where may it lead...?"
	icon_state = "road-0"
	base_icon_state = "road"
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = SMOOTH_GROUP_TURF_OPEN + SMOOTH_GROUP_TURF_COBBLESTONE_ROAD
	canSmoothWith = SMOOTH_GROUP_TURF_COBBLESTONE_ROAD
	floor_tile = /obj/item/stack/tile/cobblestone_road_tiles
	footstep = HL13_FOOTSTEP_CONCRETE
