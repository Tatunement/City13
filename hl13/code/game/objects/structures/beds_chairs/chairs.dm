/obj/structure/chair/hl13/woodenbench
	name = "wooden bench"
	desc = ""
	icon = 'hl13/icons/obj/chairs.dmi'
	icon_state = "woodenbench"
	can_buckle = FALSE //TODO: FIND A WORKAROUND TO MAKE SO THAT EVEN IF WE'RE IT WILL SET THE DIRECTION OF THE SEAT SOUTH, I ALREADY HAVE SOME IDEAS THAT I WILL TACKLE IN THE FUTURE -Tatune
	var/welded = TRUE



/obj/structure/chair/hl13/woodenbench/AltClick(mob/user)
	if (welded)
		to_chat(user, span_notice("You can't rotate it. It's welded to the floor."))
	return ..()

/obj/structure/chair/hl13/woodenbench/alt_click_secondary(mob/user)
	if (welded)
		to_chat(user, span_notice("You can't rotate it. It's welded to the floor."))
	return ..()

/obj/structure/chair/hl13/woodenbench/setDir(newdir)
	if (!welded)
		return ..()

/obj/structure/chair/hl13/woodenbench/welder_act(mob/living/user, obj/item/tool)
	if(!tool.tool_start_check(user, amount=0))
		return TRUE
	user.visible_message(span_notice("[user.name] is [welded ? "unwelding":"welding"] [name] [welded ? "free from":"to"] the floor"), \
		span_notice("You start to [welded ? "unweld":"weld"] [src] [welded ? "free from":"to"] the floor..."), \
		span_hear("You hear welding."))
	if(!tool.use_tool(src, user, 20, 1, 50))
		return FALSE
	welded = !welded
	to_chat(user, span_notice("You [welded ? "weld":"unweld"] [src] [welded ? "to":"free from"] the floor."))
	return TRUE




   /*
		TO DO:

		need to choose what custom_materials to use
		Standard in chair --> custom_materials = list(/datum/material/iron = 2000)

		need to choose what buildstacktype to use
		Standard in chair --> var/buildstacktype = /obj/item/stack/sheet/iron

		-linkovervord
   */

/obj/structure/chair/hl13/wood
	icon_state = "wooden_chair"
	name = "wooden chair"
	desc = "Old is never too old to not be in fashion."
	resistance_flags = FLAMMABLE
	icon = 'hl13/icons/obj/chairs.dmi'
	max_integrity = 70
	buildstacktype = /obj/item/stack/sheet/mineral/wood
	buildstackamount = 3
	item_chair = /obj/item/chair/wood

/obj/structure/chair/hl13/wood/variant2
	name = "hooped wooden chair"
	icon_state = "wooden_chair_2"
