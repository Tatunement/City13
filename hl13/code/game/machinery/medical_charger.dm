/obj/machinery/hl13/medical_charger
	name = "Health Station"
	desc = "A machine used for medical treatment"
	icon = 'hl13/icons/obj/medkits.dmi'
	icon_state = "medkit"

	var/vial = FALSE
	var/crushed_grub = FALSE
	var/volume = 0
	var/in_use = FALSE

/obj/machinery/hl13/medical_charger/Initialize(mapload)
	. = ..()
	reagents = new

/obj/machinery/hl13/medical_charger/attackby(obj/item/attacking_item, mob/user)
	. = ..()
	if(istype(attacking_item, /obj/item/hl13/grub_vial))
		if(!vial)
			del attacking_item
			vial = TRUE
			icon_state = "medkit-grub"

/obj/machinery/hl13/medical_charger/attack_hand_secondary(mob/user, list/modifiers)
	. = ..()
	if(vial && volume == 0)
		var/list/grub_pain = list(
			'hl13/sound/npc/antlion_grub/health_station_grub_pain_01.ogg',
			'hl13/sound/npc/antlion_grub/health_station_grub_pain_02.ogg',
			'hl13/sound/npc/antlion_grub/health_station_grub_pain_03.ogg',
			'hl13/sound/npc/antlion_grub/health_station_grub_pain_04.ogg',
			'hl13/sound/npc/antlion_grub/health_station_grub_pain_05.ogg',
			'hl13/sound/npc/antlion_grub/health_station_grub_pain_06.ogg',
			)
		icon_state = "medkit-grub-use"
		playsound(src,grub_pain[rand(1,6)],30)
		playsound(src,'hl13/sound/npc/antlion_grub/health_station_grub_compress_crush_01.ogg',30)
		playsound(src,'hl13/sound/npc/antlion_grub/health_station_grub_compress_01.ogg',30)
		sleep(1 SECONDS)
		icon_state = "medkit-grub-dead"
		volume = 50
		reagents.add_reagent_list(list(/datum/reagent/medicine/biogel = volume))
		crushed_grub = TRUE

/obj/machinery/hl13/medical_charger/attack_hand(mob/living/user, list/modifiers)
	. = ..()
	if(!in_use)
		if(!crushed_grub)
			vial = FALSE
			icon_state = "medkit"
			new /obj/item/hl13/grub_vial(src.loc)
		else
			if(volume == 0)

			else
				in_use = TRUE
				while(user.maxHealth > user.health && get_dist(user, src) == 1)
					playsound(src,'hl13/sound/npc/antlion_grub/health_station_healing_lp_01.ogg',30)
					reagents.trans_to(user, 5)
					volume -= 5
					sleep(0.8015 SECONDS)
				in_use = FALSE
