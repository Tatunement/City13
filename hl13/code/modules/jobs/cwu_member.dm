
/datum/job/cwu_member
	title = JOB_CWU_MEMBER
	description = "Pay the workforce, handle imports and exports, offer loans with interest and manage the stores."
	faction = FACTION_STATION
	total_positions = 5
	spawn_positions = 5
	supervisors = JOB_CWU_DIRECTOR
	exp_granted_type = EXP_TYPE_CREW
	outfit = /datum/outfit/job/cwu_member
	plasmaman_outfit = /datum/outfit/plasmaman
	paycheck = PAYCHECK_LOWER

	paycheck_department = ACCOUNT_CIV
	display_order = JOB_DISPLAY_CWU_MEMBER

	department_for_prefs = /datum/job_department/civilworkersunion
	departments_list = list(
		/datum/job_department/civilworkersunion,
		)


	family_heirlooms = list(/obj/item/storage/toolbox/mechanical/old/heirloom, /obj/item/clothing/gloves/cut/heirloom)

	mail_goodies = list(,
		/obj/item/choice_beacon/music = 5,
		/obj/item/toy/sprayoncan = 3,
		/obj/item/crowbar/large = 1
	)

	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS | JOB_CAN_BE_INTERN
	rpg_title = "Trades Man"
	starting_ration_unit = 5

/datum/outfit/job/cwu_member
	name = JOB_CWU_MEMBER
	id = /obj/item/card/id/advanced/hl13
	id_trim = /datum/id_trim/job/cwu_member
	jobtype = /datum/job/cwu_member
	uniform = /obj/item/clothing/under/hl13/rank/cwu
	shoes = /obj/item/clothing/shoes/hl13/brown_shoes

	l_hand = /obj/item/storage/briefcase/hl13/citizen
	accessory = /obj/item/clothing/accessory/hl13/cwu_armband





