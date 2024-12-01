/obj/machinery/hl13/ration_dispenser
	name = "Ration Dispenser"
	desc = "A machine that gives rations to the general populous"
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

/obj/machinery/hl13/ration_dispenser/attack_hand(mob/living/user, list/modifiers)
	. = ..()
	var/ration_access = FALSE
	var/collaborator = FALSE
	var/mob/living/player = user
	var/obj/item/card/id/auth = player.get_idcard(TRUE)
	var/list/access = auth.access
	for(var/datum/record/crew/target as anything in GLOB.manifest.general)
		if(target.name == player.name)
			if(target.wanted_status == WANTED_COLLABORATOR)
				collaborator = TRUE
			if(target.ration_unit >= 1)
				target.ration_unit -= 1
				ration_access = TRUE
	if(!ration_access)
		serve_animation(FALSE)
		return
	for(var/f in access)
		switch(f)
			if(ACCESS_RATION_SERVICE)
				new /obj/item/storage/hl13/ration_pack/service_ration(src.loc)
			if(ACCESS_RATION_PRIORITY || collaborator)
				new /obj/item/storage/hl13/ration_pack/priority_ration(src.loc)
			if(ACCESS_RATION_STANDARD && !collaborator)
				new /obj/item/storage/hl13/ration_pack/standard_ration(src.loc)
			if(ACCESS_RATION_BIOTIC)
				new /obj/item/storage/hl13/ration_pack/biotic(src.loc)
		serve_animation()


/obj/machinery/hl13/ration_dispenser/proc/serve_animation(serve = TRUE)
	if(serve)
		playsound(src, 'hl13/sound/computer/combine_terminal_idle1.ogg',30)
		icon_state = "rationdispenser-dispense"
		sleep(1 SECONDS)
		icon_state = "rationdispenser"
	else
		playsound(src, 'hl13/sound/computer/combine_button2.ogg',40)
		icon_state = "rationdispenser-off"
		sleep(1 SECONDS)
		icon_state = "rationdispenser"
