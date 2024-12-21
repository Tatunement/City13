
/datum/job/cmb_worker
	title = JOB_CMB_WORKER
	description = "Make repairs to the city and maintain it's machines"
	faction = FACTION_STATION
	total_positions = 5
	spawn_positions = 5
	supervisors = "Combine"
	exp_granted_type = EXP_TYPE_CREW
	outfit = /datum/outfit/job/cmb_worker
	plasmaman_outfit = /datum/outfit/plasmaman
	paycheck = PAYCHECK_LOWER

	paycheck_department = ACCOUNT_CIV
	display_order = JOB_DISPLAY_CMB_WORKER

	department_for_prefs = /datum/job_department/engineer_core

	family_heirlooms = list(/obj/item/storage/toolbox/mechanical/old/heirloom, /obj/item/card/old_hl13)

	mail_goodies = list(,
		/obj/item/choice_beacon/music = 5,
		/obj/item/toy/sprayoncan = 3,
		/obj/item/crowbar/large = 1
	)

	job_flags = JOB_ANNOUNCE_ARRIVAL  | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS
	rpg_title = "Stonemason"
	starting_ration_unit = 5

/datum/outfit/job/cmb_worker
	name = JOB_CMB_WORKER
	id = /obj/item/card/id/advanced/hl13
	id_trim = /datum/id_trim/job/cmb_worker
	jobtype = /datum/job/cwu_member
	uniform = /obj/item/clothing/under/hl13/rank/cwu
	shoes = /obj/item/clothing/shoes/hl13/work_boots
	mask = /obj/item/clothing/mask/gas/hl13/combine/combine_worker
	belt = /obj/item/storage/belt/hl13/tools/full
	back = /obj/item/hl13/sledgehammer
	suit = /obj/item/clothing/suit/armor/hl13/engineer_core_suit
	gloves = /obj/item/clothing/gloves/hl13/fingerless
