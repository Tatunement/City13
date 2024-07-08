/datum/job/dispatch
	title = JOB_DISPATCH
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = JOB_ADMINISTRATOR
	spawn_type = /mob/living/silicon/hl13/dispatch

	display_order = JOB_DISPLAY_DISPATCH
	department_for_prefs = /datum/job_department/administration
	departments_list = list(
		/datum/job_department/administration,
		)
