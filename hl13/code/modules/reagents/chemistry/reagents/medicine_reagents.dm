/datum/reagent/medicine/biogel
	name = "Bio-gel"
	description = "Heals all damage types."
	reagent_state = LIQUID
	color = "#417a35"
	var/healing = 2.5
	ph = 6.4 // PH of insect hemolymph
	chemical_flags = REAGENT_IGNORE_STASIS
	metabolization_rate = 5

/datum/reagent/medicine/biogel/on_mob_life(mob/living/carbon/affected_mob, delta_time, times_fired)
	affected_mob.adjustToxLoss(-healing * delta_time, FALSE, required_biotype = affected_biotype)
	affected_mob.adjustOxyLoss(-healing * delta_time, FALSE, required_biotype = affected_biotype, required_respiration_type = affected_respiration_type)
	affected_mob.adjustBruteLoss(-healing * delta_time, FALSE, required_bodytype = affected_bodytype)
	affected_mob.adjustFireLoss(-healing * delta_time, FALSE, required_bodytype = affected_bodytype)
	affected_mob.adjustNutiLoss(-healing * delta_time, FALSE, required_bodytype = affected_bodytype)
	..()
	. = TRUE

/datum/reagent/medicine/biogel/raw
	name = "Raw Bio-gel"
	description = "Slowly heals all damage types."
	color = "#6b7a35"
	healing = 0.6
