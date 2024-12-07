/obj/item/reagent_containers/hl13/medkit
	name = "M.S.E. First Aid Kit"
	desc = "An biotic hemolymph application kit for treating wounds"
	icon = 'hl13/icons/obj/medkits.dmi'
	icon_state = "medkit-25"
	base_icon_state = "medkit"
	volume = 25
	amount_per_transfer_from_this = 5
	possible_transfer_amounts = list(5,10,15,20,25)
	list_reagents = list(/datum/reagent/medicine/biogel = 25)
	var/list/application_sound = list('hl13/sound/items/smallmedkit1.ogg','hl13/sound/items/medshot4.ogg',)
	var/ignore_flags = NONE
	var/viewable_volume = TRUE

/obj/item/reagent_containers/hl13/medkit/attack(mob/living/affected_mob, mob/user)
	inject(affected_mob, user)

///Handles all injection checks, injection and logging.
/obj/item/reagent_containers/hl13/medkit/proc/inject(mob/living/affected_mob, mob/user)
	if(!reagents.total_volume)
		to_chat(user, span_warning("[src] is empty!"))
		return FALSE
	if(!iscarbon(affected_mob))
		return FALSE

	//Always log attemped injects for admins
	var/list/injected = list()
	for(var/datum/reagent/injected_reagent in reagents.reagent_list)
		injected += injected_reagent.name
	var/contained = english_list(injected)
	log_combat(user, affected_mob, "attempted to inject", src, "([contained])")

	if(reagents.total_volume && (ignore_flags || affected_mob.try_inject(user, injection_flags = INJECT_TRY_SHOW_ERROR_MESSAGE))) // Ignore flag should be checked first or there will be an error message.
		to_chat(affected_mob, span_warning("You feel a tiny prick!"))
		to_chat(user, span_notice("You inject [affected_mob] with [src]."))
		if(affected_mob.reagents)
			var/trans = 0
			trans = reagents.trans_to(affected_mob, amount_per_transfer_from_this, transfered_by = user, methods = INJECT)
			to_chat(user, span_notice("[trans] unit\s injected. [reagents.total_volume] unit\s remaining in [src]."))
			log_combat(user, affected_mob, "injected", src, "([contained])")
			playsound(affected_mob,application_sound[rand(1,length(application_sound))],40)
		update_icon_state()
		return TRUE
	return FALSE

/obj/item/reagent_containers/hl13/medkit/proc/get_rounded_vol()
	if(!reagents?.total_volume)
		return 0
	return clamp(round((reagents.total_volume / volume * volume), 5), 1, volume)

/obj/item/reagent_containers/hl13/medkit/update_icon_state()
	if(viewable_volume)
		var/rounded_vol = get_rounded_vol()
		icon_state = inhand_icon_state = "[base_icon_state]-[rounded_vol]"
	return ..()

/obj/item/reagent_containers/hl13/medkit/vial
	name = "M.S.E. First Aid Kit Vial"
	desc = "An biotic hemolymph application vial for treating smaller wounds"
	icon_state = "medvial-15"
	base_icon_state = "medvial"
	volume = 15
	amount_per_transfer_from_this = 5
	possible_transfer_amounts = list(5,10,15)
	list_reagents = list(/datum/reagent/medicine/biogel = 15)

/obj/item/reagent_containers/hl13/medkit/grub_guts
	name = "Grub sack"
	desc = "Ew it's sticky"
	icon_state = "bugorgan"
	base_icon_state = "bugorgan"
	viewable_volume = FALSE
	volume = 5
	possible_transfer_amounts = list(5)
	list_reagents = list(/datum/reagent/medicine/biogel/raw = 5)
	application_sound = list('hl13/sound/items/bugbait_squeeze1.ogg','hl13/sound/items/bugbait_squeeze2.ogg','hl13/sound/items/bugbait_squeeze3.ogg')

/obj/item/reagent_containers/hl13/medkit/grub_guts/inject(mob/living/affected_mob, mob/user)
	. = ..()
	del src
