/datum/job/civil_protection
	title = JOB_CIVIL_PROTECTION
	description = "Civil Protection is tasked with the subjugation of citizens through brutal oppression and surveillance."
	faction = FACTION_STATION
	total_positions = 10
	spawn_positions = 5
	supervisors = JOB_CIVIL_RANK_LEADER
	exp_granted_type = EXP_TYPE_CREW
	outfit = /datum/outfit/job/civil_protection
	paycheck = PAYCHECK_CREW

	paycheck_department = ACCOUNT_CIV
	display_order = JOB_DISPLAY_ORDER_CIVIL_PROTECTION

	departments_list = list(
		/datum/job_department/civilprotection,
		)


	mail_goodies = list(,
		/obj/item/choice_beacon/music = 5,
		/obj/item/toy/sprayoncan = 3,
		/obj/item/crowbar/large = 1
	)

	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS | JOB_CAN_BE_INTERN
	rpg_title = "Throngler"
	starting_ration_unit = 5

/datum/outfit/job/civil_protection
	name = JOB_CIVIL_PROTECTION
	id = /obj/item/card/id/advanced/hl13
	id_trim = /datum/id_trim/job/civil_protection
	jobtype = /datum/job/civil_protection
	mask = /obj/item/clothing/mask/gas/hl13/combine/civil_protection
	suit = /obj/item/clothing/suit/armor/hl13/combine/civil_protection_vest
	belt = /obj/item/storage/belt/hl13/cp_belt/full
	uniform = /obj/item/clothing/under/hl13/rank/combine/civil_protection
	shoes = /obj/item/clothing/shoes/hl13/cp_boots
	gloves = /obj/item/clothing/gloves/hl13/cp_gloves
	head = /obj/item/clothing/head/helmet/hl13/combine/helmet/civil_protection
	accessory = /obj/item/clothing/accessory/hl13/cp_armband
