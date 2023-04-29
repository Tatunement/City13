/datum/job/bartender
	title = JOB_BARTENDER
	config_tag = "BARTENDER"


/datum/job/bartender/award_service(client/winner, award)
	winner.give_award(award, winner.mob)

	var/datum/venue/bar = SSrestaurant.all_venues[/datum/venue/bar]
	var/award_score = bar.total_income
	var/award_status = winner.get_award_status(/datum/award/score/bartender_tourist_score)
	if(award_score - award_status > 0)
		award_score -= award_status
	winner.give_award(/datum/award/score/bartender_tourist_score, winner.mob, award_score)


/datum/outfit/job/bartender
	name = "Bartender"
	jobtype = /datum/job/bartender

	id_trim = /datum/id_trim/job/bartender
	uniform = /obj/item/clothing/under/rank/civilian/bartender
	suit = /obj/item/clothing/suit/armor/vest
	backpack_contents = list(
		/obj/item/storage/box/beanbag = 1,
		)
	belt = /obj/item/modular_computer/pda/bar
	ears = /obj/item/radio/headset/headset_srv
	glasses = /obj/item/clothing/glasses/sunglasses/reagent
	shoes = /obj/item/clothing/shoes/laceup

/datum/outfit/job/bartender/post_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()

	var/obj/item/card/id/W = H.wear_id
	if(H.age < AGE_MINOR)
		W.registered_age = AGE_MINOR
		to_chat(H, span_notice("You're not technically old enough to access or serve alcohol, but your ID has been discreetly modified to display your age as [AGE_MINOR]. Try to keep that a secret!"))
