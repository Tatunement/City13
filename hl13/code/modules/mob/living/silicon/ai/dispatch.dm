/mob/living/silicon/hl13/dispatch
	name = "Dispatch"
	real_name = "dispatch"
	icon = 'hl13/icons/mob/silicon/dispatch.dmi'
	icon_state = "dispatch"
	var/list/networks = list("city13")
	var/list/z_lock = list() // Lock use to these z levels
	var/mob/camera/ai_eye/remote/eyeobj
	move_resist = MOVE_FORCE_OVERPOWERING
	density = TRUE
	status_flags = CANSTUN|CANPUSH
	combat_mode = TRUE //so we always get pushed instead of trying to swap
	sight = SEE_TURFS | SEE_MOBS | SEE_OBJS
	med_hud = DATA_HUD_MEDICAL_BASIC
	sec_hud = DATA_HUD_SECURITY_BASIC
	d_hud = DATA_HUD_DIAGNOSTIC_ADVANCED
	mob_size = MOB_SIZE_LARGE
	radio = /obj/item/radio/headset/silicon/ai
	can_buckle_to = FALSE
	interaction_range = INFINITY

	var/datum/action/innate/toggle_camera/toggle_camera
	var/in_camera = FALSE
	var/list/camera_actions = list()

/mob/living/silicon/hl13/dispatch/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_IMMOBILIZED, REF(src))
	toggle_camera = new
	toggle_camera.Grant(src)
	builtInCamera = new (src)
	builtInCamera.network = list("city13")

/mob/living/silicon/hl13/dispatch/proc/give_eye_control()
	eyeobj.eye_user = src
	eyeobj.name = "Camera Eye ([src.name])"
	src.remote_control = eyeobj
	src.reset_perspective(eyeobj)
	eyeobj.setLoc(eyeobj.loc)
	for(var/atom/movable/screen/plane_master/plane_static in src.hud_used?.get_true_plane_masters(CAMERA_STATIC_PLANE))
		plane_static.unhide_plane(src)
	in_camera = TRUE

/mob/living/silicon/hl13/dispatch/proc/create_eye()
	eyeobj = new()
	eyeobj.origin = src

/mob/living/silicon/hl13/dispatch/proc/toggle_camera()
	if(!eyeobj)
		create_eye()
	if(!eyeobj) //Eye creation failed
		return
	if(!eyeobj.eye_initialized)
		var/camera_location
		var/turf/myturf = get_turf(src)
		if(eyeobj.use_static != FALSE)
			if((!length(z_lock) || (myturf.z in z_lock)) && GLOB.cameranet.checkTurfVis(myturf))
				camera_location = myturf
			else
				for(var/obj/machinery/camera/C as anything in GLOB.cameranet.cameras)
					if(!C.can_use() || length(z_lock) && !(C.z in z_lock))
						continue
					var/list/network_overlap = networks & C.network
					if(length(network_overlap))
						camera_location = get_turf(C)
						break
		else
			camera_location = myturf
			if(length(z_lock) && !(myturf.z in z_lock))
				camera_location = locate(round(world.maxx/2), round(world.maxy/2), z_lock[1])

		if(camera_location)
			eyeobj.eye_initialized = TRUE
			give_eye_control()
			eyeobj.setLoc(camera_location)
		else
			src.unset_machine()
	else
		give_eye_control()
		eyeobj.setLoc(eyeobj.loc)

/mob/living/silicon/hl13/dispatch/proc/remove_eye_control()
	for(var/V in eyeobj.visibleCameraChunks)
		var/datum/camerachunk/C = V
		C.remove(eyeobj)
	if(src.client)
		src.reset_perspective(null)
		if(eyeobj.visible_icon && src.client)
			src.client.images -= eyeobj.user_image
		src.client.view_size.unsupress()

	eyeobj.eye_user = null
	src.remote_control = null
	src.unset_machine()

	for(var/atom/movable/screen/plane_master/plane_static in src.hud_used?.get_true_plane_masters(CAMERA_STATIC_PLANE))
		plane_static.hide_plane(src)
	playsound(src, 'sound/machines/terminal_off.ogg', 25, FALSE)
	in_camera = FALSE

/datum/action/innate/toggle_camera
	name = "Toggle camera view"
	desc = "Wirelessly control all city cameras."
	button_icon = 'hl13/icons/obj/combine.dmi'
	button_icon_state = "combinecamera"

/datum/action/innate/toggle_camera/Trigger(trigger_flags)
	var/mob/living/silicon/hl13/dispatch/dp = owner
	if(!dp)
		return
	if(dp.in_camera)
		dp.remove_eye_control()
	else
		dp.toggle_camera()
