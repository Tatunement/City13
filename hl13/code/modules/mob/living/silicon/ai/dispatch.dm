/mob/living/silicon/hl13/dispatch
	name = "Dispatch"
	real_name = "dispatch"
	icon = 'hl13/icons/mob/silicon/dispatch.dmi'
	icon_state = "dispatch"
	var/list/networks = list("city13")
	var/list/z_lock = list() // Lock use to these z levels

	var/mob/camera/dp_eye/eyeobj
	var/sprint = 10
	var/cooldown = 0
	var/acceleration = 1

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
	var/camera_on = FALSE
	var/list/all_eyes = list()

/mob/living/silicon/hl13/dispatch/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_IMMOBILIZED, REF(src))
	builtInCamera = new (src)
	builtInCamera.network = list("city13")

	GLOB.dispatch_list += src

	create_eye()

/mob/living/silicon/hl13/dispatch/proc/camera_visibility(mob/camera/dp_eye/moved_eye)
	GLOB.cameranet.dp_visibility(moved_eye, client, all_eyes, TRUE)

/mob/living/silicon/hl13/dispatch/proc/plane_static()
	if(eyeobj)
		for(var/atom/movable/screen/plane_master/plane_static in src.hud_used?.get_true_plane_masters(CAMERA_STATIC_PLANE))
			plane_static.unhide_plane(src)
	else
		for(var/atom/movable/screen/plane_master/plane_static in src.hud_used?.get_true_plane_masters(CAMERA_STATIC_PLANE))
			plane_static.hide_plane(src)

/mob/living/silicon/ai/Destroy()
	GLOB.dispatch_list -= src
	QDEL_NULL(eyeobj) // No dispatch, no Eye
	return ..()
