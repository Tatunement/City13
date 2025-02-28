/datum/job/cmb_cheif_engineer
	title = JOB_CMB_CHEIF_ENGINEER
	description = "Coordinate the engineer core"
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = JOB_ADMINISTRATOR
	exp_granted_type = EXP_TYPE_CREW
	outfit = /datum/outfit/job/cmb_cheif_engineer
	plasmaman_outfit = /datum/outfit/plasmaman
	paycheck = PAYCHECK_LOWER

	paycheck_department = ACCOUNT_CIV
	display_order = JOB_DISPLAY_CHEIF_ENGINEER

	department_for_prefs = /datum/job_department/engineer_core

	departments_list = list(
		/datum/job_department/engineer_core,
		/datum/job_department/administration,
		)

	family_heirlooms = list(/obj/item/storage/toolbox/mechanical/old/heirloom, /obj/item/card/old_hl13)

	mail_goodies = list(,
		/obj/item/choice_beacon/music = 5,
		/obj/item/toy/sprayoncan = 3,
		/obj/item/crowbar/large = 1
	)

	job_flags = JOB_ANNOUNCE_ARRIVAL  | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS
	rpg_title = "Master Mason"
	starting_ration_unit = 10

/datum/outfit/job/cmb_cheif_engineer
	name = JOB_CMB_CHEIF_ENGINEER
	id = /obj/item/card/id/advanced/hl13
	id_trim = /datum/id_trim/job/cmb_cheif_engineer
	jobtype = /datum/job/cmb_cheif_engineer
	uniform = /obj/item/clothing/under/hl13/rank/cwu/director
	shoes = /obj/item/clothing/shoes/hl13/work_boots
	mask = /obj/item/clothing/mask/gas/hl13/combine/combine_worker
	belt = /obj/item/storage/belt/hl13/tools/chief/full
	suit = /obj/item/clothing/suit/armor/hl13/engineer_core_suit/cheif_engineer
	gloves = /obj/item/clothing/gloves/hl13/fingerless
