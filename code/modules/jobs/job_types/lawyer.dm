/datum/job/lawyer
	title = JOB_LAWYER
	config_tag = "LAWYER"



/datum/outfit/job/lawyer
	name = "Lawyer"
	jobtype = /datum/job/lawyer

	id_trim = /datum/id_trim/job/lawyer
	uniform = /obj/item/clothing/under/rank/civilian/lawyer/bluesuit
	suit = /obj/item/clothing/suit/toggle/lawyer
	belt = /obj/item/modular_computer/pda/lawyer
	ears = /obj/item/radio/headset/headset_srvsec
	shoes = /obj/item/clothing/shoes/laceup
	neck = /obj/item/clothing/neck/tie/red/tied
	l_pocket = /obj/item/laser_pointer/red
	r_pocket = /obj/item/clothing/accessory/lawyers_badge
	l_hand = /obj/item/storage/briefcase/lawyer

	chameleon_extras = /obj/item/stamp/law

/datum/outfit/job/lawyer/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return ..()

	var/static/use_purple_suit = FALSE //If there is one lawyer, they get the default blue suit. If another lawyer joins the round, they start with a purple suit.
	if(use_purple_suit)
		uniform = /obj/item/clothing/under/rank/civilian/lawyer/purpsuit
		suit = /obj/item/clothing/suit/toggle/lawyer/purple
	else
		use_purple_suit = TRUE
	..()

/datum/outfit/job/lawyer/get_types_to_preload()
	. = ..()
	. += /obj/item/clothing/under/rank/civilian/lawyer/purpsuit
	. += /obj/item/clothing/suit/toggle/lawyer/purple
