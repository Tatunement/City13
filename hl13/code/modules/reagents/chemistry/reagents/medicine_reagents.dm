/datum/reagent/medicine/biogel
	name = "Bio-gel"
	description = "Heals all damage types."
	reagent_state = LIQUID
	color = "#417a35"
	var/healing = 2
	ph = 6.4 // PH of insect hemolymph
	chemical_flags = REAGENT_IGNORE_STASIS

/datum/reagent/medicine/biogel/on_mob_life(mob/living/carbon/affected_mob, delta_time, times_fired)
	affected_mob.adjustToxLoss(-healing * REM * delta_time, FALSE, required_biotype = affected_biotype)
	affected_mob.adjustOxyLoss(-healing * REM * delta_time, FALSE, required_biotype = affected_biotype, required_respiration_type = affected_respiration_type)
	affected_mob.adjustBruteLoss(-healing * REM * delta_time, FALSE, required_bodytype = affected_bodytype)
	affected_mob.adjustFireLoss(-healing * REM * delta_time, FALSE, required_bodytype = affected_bodytype)
	affected_mob.adjustNutiLoss(-healing * REM * delta_time, FALSE, required_bodytype = affected_bodytype)
	..()
	. = TRUE

/datum/reagent/medicine/biogel/raw
	name = "Raw Bio-gel"
	description = "Slowly heals all damage types."
	color = "#6b7a35"
	healing = 0.6
