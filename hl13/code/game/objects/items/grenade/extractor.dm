/obj/item/grenade/hl13
	icon = 'hl13/icons/obj/weapons/grenade.dmi'
/obj/item/grenade/hl13/extractor
	name = "MK3A2 Grenade"
	desc = "Standard grenade used by combine soilders"
	icon_state = "extractor"
	det_time = 2.5 SECONDS
	ex_dev = 1
	ex_heavy = 1
	ex_light = 4
	ex_flame = 2

/obj/item/grenade/hl13/extractor/arm_grenade(mob/user, delayoverride, msg = TRUE, volume = 60)
	log_grenade(user) //Inbuilt admin procs already handle null users
	if(user)
		add_fingerprint(user)
		if(msg)
			to_chat(user, span_warning("You prime [src]! [capitalize(DisplayTimeText(det_time))]!"))
	if(shrapnel_type && shrapnel_radius)
		shrapnel_initialized = TRUE
		AddComponent(/datum/component/pellet_cloud, projectile_type = shrapnel_type, magnitude = shrapnel_radius)
	playsound(src, 'hl13/sound/weapons/grenadetick.ogg', volume, FALSE)
	if(istype(user))
		user.add_mob_memory(/datum/memory/bomb_planted, antagonist = src)
	active = TRUE
	icon_state = initial(icon_state) + "_active"
	SEND_SIGNAL(src, COMSIG_GRENADE_ARMED, det_time, delayoverride)
	addtimer(CALLBACK(src, PROC_REF(detonate)), isnull(delayoverride)? det_time : delayoverride)
