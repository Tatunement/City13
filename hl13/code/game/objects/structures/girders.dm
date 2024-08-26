GLOBAL_LIST_INIT(walls_type_icons, list(
	/turf/closed/wall/hl13/concrete_wall = icon('hl13/icons/turf/walls/concrete_wall.dmi', "concrete1_icon"),
	/turf/closed/wall/hl13/urban_concrete_wall = icon('hl13/icons/turf/walls/concrete2_wall.dmi', "concrete2_icon"),
	/turf/closed/wall/hl13/cp_concrete_wall = icon('hl13/icons/turf/walls/cp_wall.dmi', "cp_icon"),
	/turf/closed/wall/hl13/lobby_concrete_wall = icon('hl13/icons/turf/walls/lobby_wall.dmi', "lobby_icon"),
	/turf/closed/wall/hl13/store_concrete_wall = icon('hl13/icons/turf/walls/store_wall.dmi', "concrete1_icon"),
	/turf/closed/wall/hl13/brick_wall = icon('hl13/icons/turf/walls/brick_wall.dmi', "brick1_icon"),
))

GLOBAL_LIST_INIT(fwalls_type_icons, list(
	/obj/structure/falsewall/hl13/concrete_wall = icon('hl13/icons/turf/walls/concrete_wall.dmi', "concrete1_icon"),
	/obj/structure/falsewall/hl13/urban_concrete_wall = icon('hl13/icons/turf/walls/concrete2_wall.dmi', "concrete2_icon"),
	/obj/structure/falsewall/hl13/cp_concrete_wall = icon('hl13/icons/turf/walls/cp_wall.dmi', "cp_icon"),
	/obj/structure/falsewall/hl13/lobby_concrete_wall = icon('hl13/icons/turf/walls/lobby_wall.dmi', "lobby_icon"),
	/obj/structure/falsewall/hl13/store_concrete_wall = icon('hl13/icons/turf/walls/store_wall.dmi', "concrete1_icon"),
	/obj/structure/falsewall/hl13/brick_wall = icon('hl13/icons/turf/walls/brick_wall.dmi', "brick1_icon"),
))

/obj/structure/girder/hl13
	icon = 'hl13/icons/turf/walls/wall_frame.dmi'
	icon_state = "wall_frame"
	var/obj/item/stack/sheet/iron/hl13/sheet_type = /obj/item/stack/sheet/iron/hl13/metal

/obj/structure/girder/hl13/displaced
	name = "displaced girder"
	icon_state = "wall_frame_unsecured"
	anchored = FALSE
	state = GIRDER_DISPLACED
	girderpasschance = 25
	max_integrity = 120

/obj/structure/girder/hl13/displaced/reinforced
	name = "displaced girder"
	icon_state = "wall_frame_reinf"
	sheet_type = /obj/item/stack/sheet/iron/hl13/combine

/obj/structure/girder/hl13/reinforced
	name = "reinforced girder"
	icon_state = "wall_frame_reinf"
	state = GIRDER_REINF
	girderpasschance = 0
	max_integrity = 350
	sheet_type = /obj/item/stack/sheet/iron/hl13/combine

/obj/structure/girder/hl13/attackby(obj/item/W, mob/user, params)
	var/platingmodifier = 1
	if(HAS_TRAIT(user, TRAIT_QUICK_BUILD))
		platingmodifier = 0.7
		if(next_beep <= world.time)
			next_beep = world.time + 10
			playsound(src, 'sound/machines/clockcult/integration_cog_install.ogg', 50, TRUE)
	add_fingerprint(user)

	if(istype(W, /obj/item/gun/energy/plasmacutter))
		balloon_alert(user, "slicing apart...")
		if(W.use_tool(src, user, 40, volume=100))
			var/obj/item/stack/sheet/iron/M = new (loc, 2)
			if (!QDELETED(M))
				M.add_fingerprint(user)
			qdel(src)
			return

	else if(isstack(W))
		if(iswallturf(loc) || (locate(/obj/structure/falsewall) in src.loc.contents))
			balloon_alert(user, "wall already present!")
			return
		if(!isfloorturf(src.loc) && state != GIRDER_TRAM)
			balloon_alert(user, "need floor!")
			return
		if(state == GIRDER_TRAM)
			if(!locate(/obj/structure/industrial_lift/tram) in src.loc.contents)
				balloon_alert(user, "need tram floors!")
				return

		if(!istype(W, /obj/item/stack/sheet))
			return

		var/obj/item/stack/sheet/sheets = W
		if(istype(sheets, /obj/item/stack/sheet/hl13/concrete))
			var/amount = construction_cost[/obj/item/stack/sheet/hl13/concrete]
			switch(state)
				if(GIRDER_DISPLACED)
					if(sheets.get_amount() < amount)
						balloon_alert(user, "need [amount] sheets!")
						return
					var/obj/structure/falsewall/hl13/wall_to_build = show_radial_menu(
						user,
						src,
						GLOB.fwalls_type_icons,
						require_near = !issilicon(user),
					)
					if(wall_to_build != null)
						balloon_alert(user, "concealing entrance...")
						if(do_after(user, 20*platingmodifier, target = src))
							sheets.use(amount)
							var/obj/structure/falsewall/F = new wall_to_build(loc)
							transfer_fingerprints_to(F)
							qdel(src)
						return
				if(GIRDER_REINF)
					balloon_alert(user, "need combine sheet!")
					return
				if(GIRDER_TRAM)
					if(sheets.get_amount() < amount)
						balloon_alert(user, "need [amount] bricks!")
						return
					balloon_alert(user, "laying bricks...")
					if (do_after(user, 4 SECONDS, target = src))
						sheets.use(2)
						var/obj/structure/tramwall/tram_wall = new(loc)
						transfer_fingerprints_to(tram_wall)
						qdel(src)
					return
				else
					if(sheets.get_amount() < amount)
						balloon_alert(user, "need [amount] bricks!")
						return
					var/turf/closed/wall/hl13/wall_to_build = show_radial_menu(
						user,
						src,
						GLOB.walls_type_icons,
						require_near = !issilicon(user),
					)
					if(wall_to_build != null)
						balloon_alert(user, "laying bricks...")
						if (do_after(user, 40*platingmodifier, target = src))
							sheets.use(amount)
							var/turf/T = get_turf(src)
							T.PlaceOnTop(wall_to_build)
							transfer_fingerprints_to(T)
							qdel(src)
						return

		if(istype(sheets, /obj/item/stack/sheet/iron/hl13/combine))
			var/amount = construction_cost[/obj/item/stack/sheet/iron/hl13/combine]
			switch(state)
				if(GIRDER_NORMAL)
					balloon_alert(user, "Reinforcing the structure...")
					if(do_after(user, 60*platingmodifier,target = src))
						sheets.use(1)
						var/obj/structure/girder/hl13/reinforced/reinf = new (loc)
						transfer_fingerprints_to(reinf)
						qdel(src)
					return
				if(GIRDER_REINF)
					if(sheets.get_amount() < amount)
						balloon_alert(user, "need [amount] sheets..")
						return
					balloon_alert(user, "adding plating...")
					if(do_after(user, 50*platingmodifier, target = src))
						sheets.use(amount)
						var/turf/T = get_turf(src)
						T.PlaceOnTop(/turf/closed/wall/r_wall/hl13/combine_wall)
						transfer_fingerprints_to(T)
						qdel(src)
					return
				if(GIRDER_DISPLACED)
					if(istype(src, /obj/structure/girder/hl13/displaced/reinforced/))
						if(sheets.get_amount() < amount)
							balloon_alert("need [amount] sheets...")
							return
						balloon_alert(user, "concealing entrance...")
						if(do_after(user, 50*platingmodifier, target = src))
							sheets.use(amount)
							var/obj/structure/falsewall/hl13/combine_wall/C = new (loc)
							transfer_fingerprints_to(C)
							qdel(src)
						return
					if(istype(src, /obj/structure/girder/hl13/displaced))
						balloon_alert(user, "Reinforcing the structure before concealing...")
						if(do_after(user, 60*platingmodifier,target = src))
							sheets.use(1)
							var/obj/structure/girder/hl13/displaced/reinforced/reinf = new (loc)
							transfer_fingerprints_to(reinf)
							qdel(src)
						return

		add_hiddenprint(user)
	else
		return ..()


/obj/structure/girder/hl13/wrench_act(mob/user, obj/item/tool)
	. = ..()
	if(state == GIRDER_DISPLACED)
		if(!isfloorturf(loc))
			balloon_alert(user, "needs floor!")

		balloon_alert(user, "securing frame...")
		if(tool.use_tool(src, user, 40, volume=100))
			var/obj/structure/girder/hl13/G = new (loc)
			transfer_fingerprints_to(G)
			qdel(src)
		return TRUE
	else if(state == GIRDER_NORMAL && can_displace)
		balloon_alert(user, "unsecuring frame...")
		if(tool.use_tool(src, user, 40, volume=100))
			var/obj/structure/girder/hl13/displaced/D = new (loc)
			transfer_fingerprints_to(D)
			qdel(src)
		return TRUE


/obj/structure/girder/wirecutter_act(mob/user, obj/item/tool)
	. = ..()
	if(state == GIRDER_REINF_STRUTS)
		balloon_alert(user, "removing inner grille...")
		if(tool.use_tool(src, user, 40, volume=100))
			new /obj/item/stack/sheet/iron/hl13/combine(get_turf(src))
			var/obj/structure/girder/hl13/G = new (loc)
			transfer_fingerprints_to(G)
			qdel(src)
		return TRUE

// Screwdriver behavior for girders
/obj/structure/girder/screwdriver_act(mob/user, obj/item/tool)
	if(..())
		return TRUE

	. = FALSE
	if(state == GIRDER_TRAM)
		balloon_alert(user, "disassembling frame...")
		if(tool.use_tool(src, user, 4 SECONDS, volume=100))
			if(state != GIRDER_TRAM)
				return
			state = GIRDER_DISASSEMBLED
			var/obj/item/stack/sheet/iron/hl13/metal/M = new(loc, 2)
			if (!QDELETED(M))
				M.add_fingerprint(user)
			qdel(src)
		return TRUE

	if(state == GIRDER_DISPLACED)
		balloon_alert(user, "disassembling frame...")
		if(tool.use_tool(src, user, 40, volume=100))
			if(state != GIRDER_DISPLACED)
				return
			state = GIRDER_DISASSEMBLED
			var/obj/item/stack/sheet/iron/hl13/metal/M = new(loc, 2)
			if (!QDELETED(M))
				M.add_fingerprint(user)
			qdel(src)
		return TRUE

	else if(state == GIRDER_REINF)
		balloon_alert(user, "unsecuring support struts...")
		if(tool.use_tool(src, user, 40, volume=100))
			if(state != GIRDER_REINF)
				return
			state = GIRDER_REINF_STRUTS
		return TRUE

	else if(state == GIRDER_REINF_STRUTS)
		balloon_alert(user, "securing support struts...")
		if(tool.use_tool(src, user, 40, volume=100))
			if(state != GIRDER_REINF_STRUTS)
				return
			state = GIRDER_REINF
		return TRUE

/obj/structure/girder/hl13/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		var/remains = sheet_type
		new remains(loc)
	qdel(src)
