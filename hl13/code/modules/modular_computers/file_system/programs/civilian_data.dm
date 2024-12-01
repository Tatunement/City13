/datum/computer_file/program/civilian_data
	filename = "civilian_data"
	filedesc = "Civilian Records"
	category = PROGRAM_CATEGORY_MISC
	extended_desc = "Allows the user to view several basic records from the crew and modify them."
	size = 5
	program_icon = "clipboard"
	alert_able = TRUE
	tgui_id = "CivilianData"
	var/datum/record/crew/target

//gets records for CivilianData.js
/datum/computer_file/program/civilian_data/proc/GetRecordsReadable()
	var/list/all_records = list()
	for(target in GLOB.manifest.general)
		var/list/current_record = list()
		current_record["age"] = target.age
		current_record["fingerprint"] = target.fingerprint
		current_record["gender"] = target.gender
		current_record["name"] = target.name
		current_record["rank"] = target.rank
		current_record["species"] = target.species
		current_record["wanted"] = target.wanted_status
		current_record["rationunit"] = target.ration_unit
		all_records += list(current_record)
	return all_records



/datum/computer_file/program/civilian_data/ui_act(action, list/params, mob/user)
	. = ..()
	if(.)
		return
	switch(action)
		if("anti-citizen")
			for(target in GLOB.manifest.general)
				target.wanted_status = WANTED_ANTICITIZEN
				set_anticitizen(target, params)
				. = TRUE
		if("amputate")
			for(target in GLOB.manifest.general)
				target.wanted_status = WANTED_AMPUTATE
				set_amputate(target, params)
				. = TRUE
		if("collaborator")
			for(target in GLOB.manifest.general)
				target.wanted_status = WANTED_COLLABORATOR
				set_collaborator(target, params)
				. = TRUE
		if("reset")
			for(target in GLOB.manifest.general)
				target.wanted_status = WANTED_NONE
				for(var/mob/living/carbon/human/human as anything in GLOB.human_list)
					human.sec_hud_set_security_status()
				. = TRUE
		if("incarcerate")
			for(target in GLOB.manifest.general)
				target.wanted_status = WANTED_PRISONER
				for(var/mob/living/carbon/human/human as anything in GLOB.human_list)
					human.sec_hud_set_security_status()
				. = TRUE
/datum/computer_file/program/civilian_data/proc/set_anticitizen(mob/user, datum/record/crew/target, list/params)
	for(target in GLOB.manifest.general)
		var/datum/crime/new_crime = new(name = "anti-citizen", details = "Citizen has been set as a anti-citizen by [usr]", author = usr)
		target.crimes += new_crime
		for(var/mob/living/carbon/human/human as anything in GLOB.human_list)
			human.sec_hud_set_security_status()
		return TRUE

/datum/computer_file/program/civilian_data/proc/set_amputate(mob/user, datum/record/crew/target, list/params)
	for(target in GLOB.manifest.general)
		var/datum/crime/new_crime = new(name = "amputate", details = "Citizen has been set to be amputated by [usr]", author = usr)
		target.crimes += new_crime
		for(var/mob/living/carbon/human/human as anything in GLOB.human_list)
			human.sec_hud_set_security_status()
		return TRUE

/datum/computer_file/program/civilian_data/proc/set_collaborator(mob/user, datum/record/crew/target, list/params)
	for(target in GLOB.manifest.general)
		var/datum/crime/new_crime = new(name = "collaborator", details = "Citizen has been set to collaborator by [usr]", author = usr)
		target.crimes += new_crime
		for(var/mob/living/carbon/human/human as anything in GLOB.human_list)
			human.sec_hud_set_security_status()
		return TRUE


/datum/computer_file/program/civilian_data/ui_data(mob/user)
	var/list/data = list()
	data["records"] = GetRecordsReadable()
	return data
