/datum/id_trim/job/citizen
	assignment = "Citizen"
	trim_state = "assigned"
	department_color = COLOR_NAVY
	sechud_icon_state = SECHUD_HL13_CITIZEN
	minimal_access = list(
		ACCESS_RATION_STANDARD,
		)
	extra_access = list(
		ACCESS_RATION_STANDARD,
		)
	template_access = list(
		ACCESS_RATION_STANDARD,
		)
	job = /datum/job/citizen

/datum/id_trim/job/civil_protection
	assignment = "Civil Protection officer"
	trim_state = "assigned"
	department_color = COLOR_CP_BLUE
	sechud_icon_state = SECHUD_HL13_CIVIL_PROTECTION
	minimal_access = list(
		ACCESS_RATION_PRIORITY,
		ACCESS_CIVIL_PROTECTION,
		)
	extra_access = list(
		ACCESS_RATION_PRIORITY,
		ACCESS_CIVIL_PROTECTION,
		)
	template_access = list(
		ACCESS_RATION_PRIORITY,
		ACCESS_CIVIL_PROTECTION,
		)
	job = /datum/job/civil_protection

/datum/id_trim/job/civil_rank_leader
	assignment = "Civil Rank Leader"
	trim_state = "assigned"
	department_color = COLOR_ADMINISTRATION_RED
	sechud_icon_state = SECHUD_HL13_CIVIL_PROTECTION_COMMANDER
	minimal_access = list(
		ACCESS_RATION_SERVICE,
		ACCESS_CIVIL_PROTECTION,
		)
	extra_access = list(
		ACCESS_RATION_SERVICE,
		ACCESS_CIVIL_PROTECTION,
		)
	template_access = list(
		ACCESS_RATION_SERVICE,
		ACCESS_CIVIL_PROTECTION,
		)
	job = /datum/job/civil_rank_leader

/datum/id_trim/job/cwu_member
	assignment = "CWU Member"
	trim_state = "assigned"
	department_color = COLOR_CWU_YELLOW
	sechud_icon_state = SECHUD_HL13_CWU_MEMBER
	minimal_access = list(
		ACCESS_RATION_PRIORITY,
		)
	extra_access = list(
		ACCESS_RATION_PRIORITY,
		)
	template_access = list(
		ACCESS_RATION_PRIORITY,
		)
	job = /datum/job/cwu_member
/datum/id_trim/job/cwu_medic
	assignment = "CWU Member"
	trim_state = "assigned"
	department_color = COLOR_CWU_YELLOW
	sechud_icon_state = SECHUD_HL13_CWU_MEDIC
	minimal_access = list(ACCESS_RATION_PRIORITY)
	extra_access = list(
		ACCESS_RATION_PRIORITY,
		)
	template_access = list(
		ACCESS_RATION_PRIORITY,
		)
	job = /datum/job/cwu_medic

/datum/id_trim/job/cwu_director
	assignment = "CWU Director"
	trim_state = "assigned"
	department_color = COLOR_ADMINISTRATION_RED
	sechud_icon_state = SECHUD_HL13_CWU_DIRECTOR
	minimal_access = list(ACCESS_RATION_SERVICE)
	extra_access = list(
		ACCESS_RATION_SERVICE,
		)
	template_access = list(
		ACCESS_RATION_SERVICE,
		)
	job = /datum/job/cwu_director

/obj/item/card/old_hl13
	name = "card"
	desc = "Seems to be some kind of prototype ID card. It seems to have some pencil\
	markings on the back of the card that seems to just be the ramblings of someone named Revel."
	icon_state = "old_citizen_id"

/datum/id_trim/job/city_administrator
	assignment = "City Administrator"
	trim_state = "assigned"
	department_color = COLOR_ADMINISTRATION_RED
	sechud_icon_state = SECHUD_HL13_CITY_ADMINISTRATOR
	minimal_access = list(ACCESS_RATION_SERVICE)
	extra_access = list(
		ACCESS_RATION_SERVICE,
		)
	template_access = list(
		ACCESS_RATION_SERVICE,
		)
	job = /datum/job/city_administrator

/datum/id_trim/job/cmb_worker
	assignment = "Combine Worker"
	trim_state = "assigned"
	department_color = COLOR_BEIGE
	sechud_icon_state = SECHUD_HL13_CITIZEN
	minimal_access = list(ACCESS_RATION_PRIORITY)
	extra_access = list(
		ACCESS_RATION_PRIORITY,
		)
	template_access = list(
		ACCESS_RATION_PRIORITY,
		)
	job = /datum/job/cmb_worker
