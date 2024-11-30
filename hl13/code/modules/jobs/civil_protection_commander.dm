/datum/job/civil_protection_commander
	title = JOB_CIVIL_PROTECTION_COMMANDER
	description = " Manage the CP forces, and ensure your units are working cooperatively and efficiently."
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD|DEADMIN_POSITION_SECURITY
	department_head = list(JOB_CAPTAIN)
	head_announce = list(RADIO_CHANNEL_SECURITY)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = JOB_ADMINISTRATOR
	req_admin_notify = 1
	minimal_player_age = 14
	exp_requirements = 300
	exp_required_type = EXP_TYPE_CREW
	exp_required_type_department = EXP_TYPE_SECURITY
	exp_granted_type = EXP_TYPE_CREW


	department_for_prefs = /datum/job_department/civilprotection
	outfit = /datum/outfit/job/cpc
	departments_list = list(
		/datum/job_department/civilprotection,
		/datum/job_department/administration,
		)

	liver_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM, TRAIT_ROYAL_METABOLISM)

	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_SEC

	display_order = JOB_DISPLAY_ORDER_CIVIL_PROTECTION_COMMANDER
	bounty_types = CIV_JOB_SEC

	family_heirlooms = list(/obj/item/book/manual/wiki/security_space_law)
	rpg_title = "Throngler Captian"
	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_BOLD_SELECT_TEXT | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS | JOB_CAN_BE_INTERN

	voice_of_god_power = 1.4 //Command staff has authority
	starting_ration_unit = 15


/datum/job/civil_protection_commander/get_captaincy_announcement(mob/living/captain)
	return "Due to staffing shortages, newly promoted Acting City Administrator [captain.real_name] is at the city."


/datum/outfit/job/cpc
	name = "Civil Protection Commander"
	jobtype = /datum/id_trim/job/civil_protection_commander
	id = /obj/item/card/id/advanced/hl13
	id_trim = /datum/id_trim/job/civil_protection_commander
	uniform = /obj/item/clothing/under/hl13/rank/combine/civil_protection_commander
	suit = /obj/item/clothing/suit/armor/hl13/combine/civil_protection_vest/commando
	head = /obj/item/clothing/head/helmet/hl13/combine/helmet/civil_protection
	ears = /obj/item/radio/headset/heads/hos/alt
	gloves = /obj/item/clothing/gloves/hl13/cp_gloves
	shoes = /obj/item/clothing/shoes/hl13/cp_boots
	mask = /obj/item/clothing/mask/gas/hl13/combine/commando
	accessory = /obj/item/clothing/accessory/hl13/cp_armband

	belt = /obj/item/storage/belt/hl13/cp_belt/full
	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec

	box = /obj/item/storage/box/survival/security
	chameleon_extras = list(
		/obj/item/gun/energy/e_gun/hos,
		/obj/item/stamp/hos,
		)
	implants = list(/obj/item/implant/mindshield)

