/turf/open/floor/city_floor/concrete_path
	icon = 'hl13/icons/turf/floors/concretepath.dmi'
	name = "concrete path"
	desc = "Withered by time"
	icon_state = "path-0"
	base_icon_state = "path"
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = SMOOTH_GROUP_TURF_OPEN + SMOOTH_GROUP_TURF_CONCRETE_PATH
	canSmoothWith = SMOOTH_GROUP_TURF_CONCRETE_PATH
	floor_tile = /obj/item/stack/tile/concrete/concrete_path
	footstep = HL13_FOOTSTEP_CONCRETE
