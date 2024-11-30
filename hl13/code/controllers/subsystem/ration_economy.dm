SUBSYSTEM_DEF(ration_economy)
	name = "Ration Economy"
	runlevels = RUNLEVEL_GAME
	init_order = INIT_ORDER_RATION_ECONOMY

/datum/controller/subsystem/ration_economy/fire(resumed)
	if(SSday_night.get_twentyfourhour_timestamp() == "09:15")
		for(var/datum/record/crew/target as anything in GLOB.manifest.general)
			if(target.rank != JOB_CITIZEN)
				target.ration_unit += 1
