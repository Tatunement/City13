/datum/computer_file/program/socio_stability_monitor
	filename = "stm"
	filedesc = "Socio-Stability Monitor"
	category = PROGRAM_CATEGORY_MISC
	extended_desc = "A measure of how stable the city is."
	size = 5
	program_icon = "book-medical"
	alert_able = TRUE
	tgui_id = "SocioStabilityMonitor"
	var/stability_value = 100
	var/instability_value = 0

/datum/computer_file/program/socio_stability_monitor/proc/socio_stability_modify()
	stability_value =- instability_value
	return stability_value

/datum/computer_file/program/socio_stability_monitor/ui_data(mob/user)
	var/list/data = list()
	data["stability_data"] = stability_value
	return data



