/turf/closed/wall/hl13
	sheet_type = /obj/item/stack/rubble
	girder_type = /obj/structure/girder/hl13

/turf/closed/wall/hl13/break_wall()
	new sheet_type(src, sheet_amount)
	if(girder_type)
		return new girder_type(src)

/turf/closed/wall/hl13/devastate_wall()
	new /obj/item/stack/rubble(src,3)

/turf/closed/wall/hl13/deconstruction_hints(mob/user)
	return span_notice("The bricks are cemented together.")


/turf/closed/wall/hl13/dismantle_wall(devastated = FALSE, explode = FALSE)
	if(devastated)
		devastate_wall()
	else
		playsound(src, 'hl13/sound/physics/concrete/boulder_impact_hard4.ogg', 100, TRUE)
		var/newgirder = break_wall()
		if(newgirder) //maybe we don't /want/ a girder!
			transfer_fingerprints_to(newgirder)

	for(var/obj/O in src.contents) //Eject contents!
		if(istype(O, /obj/structure/sign/poster))
			var/obj/structure/sign/poster/P = O
			P.roll_and_drop(src)
	if(decon_type)
		ChangeTurf(decon_type, flags = CHANGETURF_INHERIT_AIR)
	else
		ScrapeAway()
	QUEUE_SMOOTH_NEIGHBORS(src)

/turf/closed/wall/hl13/try_decon(obj/item/I, mob/user, turf/T)
	if(I.tool_behaviour == TOOL_SLEDGEHAMMER)
		to_chat(user, span_notice("You begin hammering through the outer concrete..."))
		if(I.use_tool(src, user, slicing_duration))
			if(iswallturf(src))
				to_chat(user, span_notice("You remove the outer concrete."))
				dismantle_wall()
		return TRUE
	return FALSE

/turf/closed/wall/hl13/concrete_wall
	name = "concrete wall"
	desc = "A boring old yellow concrete wall. Remnants of a dead civilization, but protection against the weather."
	icon = 'hl13/icons/turf/walls/concrete_wall.dmi'
	base_icon_state = "concrete1"
	icon_state = "concrete1-0"

/turf/closed/wall/hl13/urban_concrete_wall
	name = "urban concrete wall"
	desc = "A huge chunk of concrete. Wow!"
	icon = 'hl13/icons/turf/walls/concrete2_wall.dmi'
	base_icon_state = "concrete2"
	icon_state = "concrete2-0"

/turf/closed/wall/hl13/cp_concrete_wall
	name = "security concrete wall"
	desc = "A concrete wall painted blue to signify a Civil Protection controlled area."
	icon = 'hl13/icons/turf/walls/cp_wall.dmi'
	base_icon_state = "cp"
	icon_state = "cp-0"

/turf/closed/wall/hl13/lobby_concrete_wall
	name = "lobby concrete wall"
	desc = "A concrete wall painted orange."
	icon = 'hl13/icons/turf/walls/lobby_wall.dmi'
	base_icon_state = "lobby"
	icon_state = "lobby-0"

/turf/closed/wall/hl13/store_concrete_wall
	name = "store concrete wall"
	desc = "The concrete exterior of a CWU store."
	icon = 'hl13/icons/turf/walls/store_wall.dmi'
	base_icon_state = "concrete1"
	icon_state = "concrete1-0"

/turf/closed/wall/hl13/brick_wall
	name = "brick wall"
	desc = "A huge lay of bricks."
	icon = 'hl13/icons/turf/walls/brick_wall.dmi'
	base_icon_state = "brick1"
	icon_state = "brick1-0"

/turf/closed/wall/hl13/home_wall
	name = "interior wall"
	desc = "A nicely paneled plaster wall used for interior rooms."
	icon = 'hl13/icons/turf/walls/home1_wall.dmi'
	base_icon_state = "home1"
	icon_state = "home1-0"

/turf/closed/wall/hl13/train_wall_front
	name = "train wall"
	desc = "They're always departing but they never arrive."
	icon = 'hl13/icons/turf/walls/train_wall.dmi'
	base_icon_state = "train"
	icon_state = "train-157"
	smoothing_groups = SMOOTH_GROUP_CLOSED_TURFS + SMOOTH_GROUP_TRAIN_WALLS
	canSmoothWith = SMOOTH_GROUP_TRAIN_WALLS



