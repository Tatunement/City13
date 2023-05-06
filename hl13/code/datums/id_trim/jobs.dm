/datum/id_trim/job/citizen
	assignment = "Citizen"
	trim_state = "assigned"
	department_color = COLOR_NAVY
	sechud_icon_state = SECHUD_HL13_CITIZEN
	minimal_access = list()
	extra_access = list(
		ACCESS_MAINT_TUNNELS,
		)
	template_access = list(
		ACCESS_CAPTAIN,
		ACCESS_CHANGE_IDS,
		ACCESS_HOP,
		)
	job = /datum/job/citizen

/datum/id_trim/job/civil_protection
	assignment = "Civil Protection officer"
	trim_state = "assigned"
	department_color = COLOR_CP_BLUE
	sechud_icon_state = SECHUD_HL13_CIVIL_PROTECTION
	minimal_access = list()
	extra_access = list(
		ACCESS_MAINT_TUNNELS,
		)
	template_access = list(
		ACCESS_CAPTAIN,
		ACCESS_CHANGE_IDS,
		ACCESS_HOP,
		)
	job = /datum/job/civil_protection

/datum/id_trim/job/civil_protection_commander
	assignment = "Civil Protection Commander"
	trim_state = "assigned"
	department_color = COLOR_ADMINISTRATION_RED
	sechud_icon_state = SECHUD_HL13_CIVIL_PROTECTION_COMMANDER
	minimal_access = list()
	extra_access = list(
		ACCESS_MAINT_TUNNELS,
		)
	template_access = list(
		ACCESS_CAPTAIN,
		ACCESS_CHANGE_IDS,
		ACCESS_HOP,
		)
	job = /datum/job/civil_protection_commander

/datum/id_trim/job/cwu_member
	assignment = "CWU Member"
	trim_state = "assigned"
	department_color = COLOR_CWU_YELLOW
	sechud_icon_state = SECHUD_HL13_CWU_MEMBER
	minimal_access = list()
	extra_access = list(
		ACCESS_MAINT_TUNNELS,
		)
	template_access = list(
		ACCESS_CAPTAIN,
		ACCESS_CHANGE_IDS,
		ACCESS_HOP,
		)
	job = /datum/job/cwu_member
/datum/id_trim/job/cwu_medic
	assignment = "CWU Member"
	trim_state = "assigned"
	department_color = COLOR_CWU_YELLOW
	sechud_icon_state = SECHUD_HL13_CWU_MEDIC
	minimal_access = list()
	extra_access = list(
		ACCESS_MAINT_TUNNELS,
		)
	template_access = list(
		ACCESS_CAPTAIN,
		ACCESS_CHANGE_IDS,
		ACCESS_HOP,
		)
	job = /datum/job/cwu_medic

/datum/id_trim/job/cwu_director
	assignment = "CWU Director"
	trim_state = "assigned"
	department_color = COLOR_ADMINISTRATION_RED
	sechud_icon_state = SECHUD_HL13_CWU_DIRECTOR
	minimal_access = list()
	extra_access = list(
		ACCESS_MAINT_TUNNELS,
		)
	template_access = list(
		ACCESS_CAPTAIN,
		ACCESS_CHANGE_IDS,
		ACCESS_HOP,
		)
	job = /datum/job/cwu_director

/obj/item/card/old_hl13
	name = "card"
	desc = "Seems to be some kind of prototype ID card. It seems to have a some pencil\
	markings on the back of the card that seems to just be the ramblings of someone named Revel."
	icon_state = "old_citizen_id"
