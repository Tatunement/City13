/turf/closed/wall/r_wall/hl13/combine_wall
	name = "combine wall"
	desc = "A strange, blue-tinted otherworldy metal wall. Cold to the touch."
	icon = 'hl13/icons/turf/walls/combine_wall.dmi'
	base_icon_state = "combine"
	icon_state = "combine-0"
	var/deconstruction_icon = "cr_wall"
	sheet_type = /obj/item/stack/sheet/iron/hl13/combine
	girder_type = /obj/structure/girder/hl13/reinforced

/turf/closed/wall/r_wall/hl13/combine_wall/devastate_wall()
	new sheet_type(src, sheet_amount)
	new /obj/item/stack/sheet/iron/hl13/metal(src, 2)

/turf/closed/wall/r_wall/deconstruction_hints(mob/user)
	switch(d_state)
		if(INTACT)
			return span_notice("The outer <b>panel</b> is fully intact.")
		if(ALLOY_PANELING_UNWELDED)
			return span_notice("The outer <i>panel</i> has been unwelded, but is still <b>lodged</b> in the wall")
		if(WIRE_GRID)
			return span_notice("The outer <i>panel</i> has been removed, exposing the <b>protective wire grid</b>")
		if(SUPPORT_BEAMS)
			return span_notice("The protective wire grid has been <i>cut through</i>, exposing the <b>connective support beams</b>.")
		if(SUPPORT_STRUCTURE_WELDED)
			return span_notice("The support beams have been <i>unwrenched</i>, and the support structure is <b>welded</b> firmly to the girder.")
		if(SUPPORT_STRUCTURE_UNWELDED)
			return span_notice("The support structure has been <i>unwelded</i>, but are still <b>lodged</b> firmly to the girder.")
		if(ELECTRONIC_PANEL)
			return span_notice("The support structure has been <i>removed</i>, showing the internal electronic panel <b>screwed up</b> to the girder.")
		if(DISMANTLED)
			return span_notice("the internal electronic panel has been <i>unscrewed</i>, the wall <b>barely keeps itself</b> together.")

/turf/closed/wall/r_wall/try_decon(obj/item/W, mob/user, turf/T)
	//DECONSTRUCTION
	switch(d_state)
		if(INTACT)
			if(W.tool_behaviour == TOOL_WELDER)
				if(!W.tool_start_check(user, amount=0))
					return
				balloon_alert(user, "slicing apart the alloy panelling...")
				if(W.use_tool(src, user, 60, volume=100))
					if(!istype(src, /turf/closed/wall/r_wall) || d_state != INTACT)
						return TRUE
					d_state = ALLOY_PANELING_UNWELDED
					update_appearance()
					balloon_alert(user, span_notice("You slice through the alloy panelling."))
				return TRUE

		if(ALLOY_PANELING_UNWELDED)
			if(W.tool_behaviour == TOOL_CROWBAR)
				balloon_alert(user, "you struggle to pry off the alloy panelling...")
				if(W.use_tool(src, user, 100, volume=100))
					if(!istype(src, /turf/closed/wall/r_wall) || d_state != ALLOY_PANELING_UNWELDED)
						return TRUE
					d_state = WIRE_GRID
					update_appearance()
					balloon_alert(user, span_notice("You pry off the alloy panelling..."))
				return TRUE

			else if(W.tool_behaviour == TOOL_WELDER)
				if(!W.tool_start_check(user, amount=0))
					return
				balloon_alert(user, "welding the alloy panelling...")
				if(W.use_tool(src, user, 60, volume=100))
					if(!istype(src, /turf/closed/wall/r_wall) || d_state != ALLOY_PANELING_UNWELDED)
						return TRUE
					d_state = INTACT
					update_appearance()
					balloon_alert(user, span_notice("You welded the alloy panelling back together."))
				return TRUE

		if(WIRE_GRID)
			if(W.tool_behaviour == TOOL_WIRECUTTER)
				balloon_alert(user, span_notice("You cut through the exterior wire grid..."))
				W.play_tool_sound(src, 100)
				d_state = SUPPORT_BEAMS
				update_appearance()
				return TRUE

			else if(W.tool_behaviour == TOOL_CROWBAR)
				balloon_alert(user, span_notice("You start to pry the alloy panelling back into place..."))
				if(W.use_tool(src, user, 20, volume=100))
					if(!istype(src, /turf/closed/wall/r_wall) || d_state != WIRE_GRID)
						return TRUE
					d_state = ALLOY_PANELING_UNWELDED
					update_appearance()
					balloon_alert(user, span_notice("The alloy panelling has been pried back into place."))
				return TRUE

		if(SUPPORT_BEAMS)
			if(W.tool_behaviour == TOOL_WRENCH)
				balloon_alert(user, span_notice("You start loosening the anchoring bolts which secure the support beams to their frame..."))
				if(W.use_tool(src, user, 40, volume=100))
					if(!istype(src, /turf/closed/wall/r_wall) || d_state != SUPPORT_BEAMS)
						return TRUE
					d_state = SUPPORT_STRUCTURE_WELDED
					update_appearance()
					balloon_alert(user, span_notice("You remove the bolts anchoring the support beams."))
				return TRUE

			else if(W.tool_behaviour == TOOL_WIRECUTTER)
				W.play_tool_sound(src, 100)
				d_state = WIRE_GRID
				update_appearance()
				to_chat(user, span_notice("You repair the wire grid."))
				return TRUE

		if(SUPPORT_STRUCTURE_WELDED)
			if(W.tool_behaviour == TOOL_WELDER)
				if(!W.tool_start_check(user, amount=0))
					return
				balloon_alert(user, "slicing apart support stucture...")
				if(W.use_tool(src, user, 60, volume=100))
					if(!istype(src, /turf/closed/wall/r_wall) || d_state != SUPPORT_STRUCTURE_WELDED)
						return TRUE
					d_state = SUPPORT_STRUCTURE_UNWELDED
					update_appearance()
					balloon_alert(user, span_notice("You slice through the support stucture."))
				return TRUE

			if(W.tool_behaviour == TOOL_WRENCH)
				balloon_alert(user, span_notice("You start tightening the bolts which secure the support beams to their frame..."))
				W.play_tool_sound(src, 100)
				if(W.use_tool(src, user, 40))
					if(!istype(src, /turf/closed/wall/r_wall) || d_state != SUPPORT_STRUCTURE_WELDED)
						return TRUE
					d_state = SUPPORT_BEAMS
					update_appearance()
					balloon_alert(user, span_notice("You tighten the bolts anchoring the support beams."))
				return TRUE

		if(SUPPORT_STRUCTURE_UNWELDED)
			if(W.tool_behaviour == TOOL_CROWBAR)
				balloon_alert(user, "you struggle to pry off the support structure...")
				if(W.use_tool(src, user, 100, volume=100))
					if(!istype(src, /turf/closed/wall/r_wall) || d_state != SUPPORT_STRUCTURE_UNWELDED)
						return TRUE
					d_state = ELECTRONIC_PANEL
					update_appearance()
					balloon_alert(user, span_notice("You pry off the support structure."))
				return TRUE

			else if(W.tool_behaviour == TOOL_WELDER)
				if(!W.tool_start_check(user, amount=0))
					return
				balloon_alert(user, "welding the support structure...")
				if(W.use_tool(src, user, 60, volume=100))
					if(!istype(src, /turf/closed/wall/r_wall) || d_state != SUPPORT_STRUCTURE_UNWELDED)
						return TRUE
					d_state = SUPPORT_STRUCTURE_WELDED
					update_appearance()
					balloon_alert(user, span_notice("You welded the support structure back together."))

		if(ELECTRONIC_PANEL)
			if(W.tool_behaviour == TOOL_SCREWDRIVER)
				balloon_alert(user, span_notice("You begin unsecuring the electronic panel..."))
				if(W.use_tool(src, user, 40, volume=100))
					if(!istype(src, /turf/closed/wall/r_wall) || d_state != ELECTRONIC_PANEL)
						return TRUE
					d_state = DISMANTLED
					update_appearance()
					to_chat(user, span_notice("You unsecure the electronic panel."))
				return TRUE

			else if(W.tool_behaviour == TOOL_CROWBAR)
				balloon_alert(user, span_notice("You start to pry the support structure back into place..."))
				if(W.use_tool(src, user, 20, volume=100))
					if(!istype(src, /turf/closed/wall/r_wall) || d_state != ELECTRONIC_PANEL)
						return TRUE
					d_state = SUPPORT_STRUCTURE_UNWELDED
					update_appearance()
					balloon_alert(user, span_notice("The support structure has been pried back into place."))
				return TRUE

		if(DISMANTLED)
			if(W.tool_behaviour == TOOL_CROWBAR)
				to_chat(user, span_notice("You struggle to pry off the wall structure..."))
				if(W.use_tool(src, user, 100, volume=100))
					if(!istype(src, /turf/closed/wall/r_wall) || d_state != DISMANTLED)
						return TRUE
					to_chat(user, span_notice("You pry off the wall structure."))
					dismantle_wall()
				return TRUE

			else if(W.tool_behaviour == TOOL_SCREWDRIVER)
				balloon_alert(user, span_notice("You begin securing the electronic panel..."))
				if(W.use_tool(src, user, 40, volume=100))
					if(!istype(src, /turf/closed/wall/r_wall) || d_state != DISMANTLED)
						return TRUE
					d_state = DISMANTLED
					update_appearance()
					to_chat(user, span_notice("You unsecure the electronic panel."))
				return TRUE
	return FALSE

/turf/closed/wall/r_wall/hl13/combine_wall/update_icon_state()
	if(d_state != INTACT)
		icon_state = "[deconstruction_icon]-[d_state]"
	else
		icon_state = "[base_icon_state]-[smoothing_junction]"
	return ..()
