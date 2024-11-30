/datum/job/cwu_director
	title = JOB_CWU_DIRECTOR
	description = "Pay the workforce, handle imports and exports, offer loans with interest and manage the stores."
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = JOB_ADMINISTRATOR
	exp_granted_type = EXP_TYPE_CREW
	outfit = /datum/outfit/job/cwu_director
	plasmaman_outfit = /datum/outfit/plasmaman
	paycheck = PAYCHECK_LOWER

	paycheck_department = ACCOUNT_CIV
	display_order = JOB_DISPLAY_CWU_DIRECTOR

	department_for_prefs = /datum/job_department/civilworkersunion
	departments_list = list(
		/datum/job_department/civilworkersunion,
		/datum/job_department/administration,
		)


	family_heirlooms = list(/obj/item/storage/toolbox/mechanical/old/heirloom, /obj/item/clothing/gloves/cut/heirloom)

	mail_goodies = list(,
		/obj/item/choice_beacon/music = 5,
		/obj/item/toy/sprayoncan = 3,
		/obj/item/crowbar/large = 1
	)

	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS | JOB_CAN_BE_INTERN
	rpg_title = "The Merchent King"
	starting_ration_unit = 15

/datum/outfit/job/cwu_director
	name = JOB_CWU_DIRECTOR
	id = /obj/item/card/id/advanced/hl13
	id_trim = /datum/id_trim/job/cwu_director
	jobtype = /datum/job/cwu_director

	suit = /obj/item/clothing/suit/toggle/labcoat/hl13/jacket/cwu_director_jacket
	uniform = /obj/item/clothing/under/hl13/rank/cwu/director
	shoes = /obj/item/clothing/shoes/hl13/brown_shoes
	l_hand = /obj/item/storage/briefcase/hl13/citizen

	neck = /obj/item/clothing/neck/tie/hl13/cwu_director_tie
	accessory = /obj/item/clothing/accessory/hl13/cwu_armband





