/area/city13/
	icon = 'icons/area/areas_station.dmi'

/area/city13/street
	name = "City Street"
	icon_state = "transit_tube"
	has_gravity = TRUE
	always_unpowered = FALSE
	power_environ = TRUE
	power_equip = TRUE
	power_light = TRUE
	requires_power = TRUE
	ambience_index = AMBIENCE_HL13
	area_flags = UNIQUE_AREA
	min_ambience_cooldown = 70 SECONDS
	max_ambience_cooldown = 220 SECONDS
	outdoors = TRUE
	ambient_buzz = 'hl13/sound/ambience/station_ambience_stereo_loop1.ogg'
	ambient_buzz_vol = 5
	ambientsounds = list('hl13/sound/ambience/scanner_alert_pass1.ogg','hl13/sound/ambience/wind_moan2.ogg','hl13/sound/ambience/wind_snippet1.ogg','hl13/sound/ambience/wind_snippet2.ogg')

/area/city13/inside
	name = "City Street"
	icon_state = "sec_prison"
	has_gravity = TRUE
	always_unpowered = FALSE
	power_environ = TRUE
	power_equip = TRUE
	power_light = TRUE
	requires_power = TRUE
	ambience_index = AMBIENCE_HL13
	area_flags = UNIQUE_AREA
	min_ambience_cooldown = 70 SECONDS
	max_ambience_cooldown = 220 SECONDS
	outdoors = FALSE
	ambient_buzz = 'hl13/sound/ambience/town_ambience.ogg'
	ambient_buzz_vol = 10
	ambientsounds = list('hl13/sound/ambience/apc_alarm_pass1.ogg','hl13/sound/ambience/city_skypass1.ogg')
	//underground = TRUE must check if it works on areas that do not have a top floor above them

