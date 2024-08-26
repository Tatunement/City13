GLOBAL_LIST_INIT(hl13_metal_recipes, list(
	new/datum/stack_recipe("wall girders (anchored)", /obj/structure/girder/hl13, 2, time = 4 SECONDS, one_per_turf = TRUE, on_solid_ground = TRUE, trait_booster = TRAIT_QUICK_BUILD, trait_modifier = 0.75, category = CAT_STRUCTURE)
))

/obj/item/stack/sheet/plastic/hl13
	icon = 'hl13/icons/obj/stack_objects.dmi'
	icon_state = "sheet-plastic"
	desc = "Compress dinosaur over millions of years, then refine, split and mold, and voila! You have plastic."

/obj/item/stack/sheet/iron/hl13/metal
	icon = 'hl13/icons/obj/stack_objects.dmi'
	name = "metal"
	icon_state = "sheet-metal"
	desc = "Sheets made out of metal."

/obj/item/stack/sheet/iron/hl13/metal/get_main_recipes()
	. = ..()
	. += GLOB.hl13_metal_recipes

GLOBAL_LIST_INIT(hl13_combine_recipes, list(
	new/datum/stack_recipe("combine floor tile", /obj/item/stack/tile/combine_tiles, 1, 4, 20, category = CAT_TILES)
))

/obj/item/stack/sheet/iron/hl13/combine
	icon = 'hl13/icons/obj/stack_objects.dmi'
	name = "combine metal"
	icon_state = "sheet-combine_metal"
	desc = "Sheets made out of combine metal."

/obj/item/stack/sheet/iron/hl13/combine/get_main_recipes()
	. = ..()
	. += GLOB.hl13_combine_recipes

GLOBAL_LIST_INIT(hl13_concrete_recipes, list(
	new/datum/stack_recipe("concrete floor tile", /obj/item/stack/tile/concrete/concrete_floor, 1, 4, 20, category = CAT_TILES),
	new/datum/stack_recipe("concrete road tile", /obj/item/stack/tile/concrete/concrete_road, 1, 4, 20, category = CAT_TILES),
	new/datum/stack_recipe("concrete path tile", /obj/item/stack/tile/concrete/concrete_path, 1, 4, 20, category = CAT_TILES),
	new/datum/stack_recipe("concrete tiles tile",/obj/item/stack/tile/concrete/concrete_tiles, 1, 4, 20, category = CAT_TILES),
	new/datum/stack_recipe("yellow floor tile", /obj/item/stack/tile/yellow_floor/yellow_floor_tiles, 1, 4, 20, category = CAT_TILES),
	new/datum/stack_recipe("yellow flooring tile", /obj/item/stack/tile/yellow_floor/yellow_flooring_tiles, 1, 4, 20, category = CAT_TILES),
	new/datum/stack_recipe("yellow floor station tile", /obj/item/stack/tile/yellow_floor/yellow_floor_station_tiles, 1, 4, 20, category = CAT_TILES),
	new/datum/stack_recipe("black yellow floor tile", /obj/item/stack/tile/yellow_floor/black_yellow_tiles, 1, 4, 20, category = CAT_TILES),
	new/datum/stack_recipe("cobblestone floor tile", /obj/item/stack/tile/cobblestone_tiles, 1, 4, 20, category = CAT_TILES),
	new/datum/stack_recipe("cobblestone road tile", /obj/item/stack/tile/cobblestone_road_tiles, 1, 4, 20, category = CAT_TILES),
))

/obj/item/stack/sheet/hl13/concrete
	icon = 'hl13/icons/obj/stack_objects.dmi'
	name = "concrete bricks"
	icon_state = "stack_concrete"
	desc = "Bricks made out of concrete."

/obj/item/stack/sheet/hl13/concrete/get_main_recipes()
	. = ..()
	. += GLOB.hl13_concrete_recipes
