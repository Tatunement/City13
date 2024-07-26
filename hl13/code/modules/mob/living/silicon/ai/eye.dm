/mob/camera/dp_eye
	name = "Inactive Dispatch Eye"
	icon_state = "ai_camera"
	icon = 'icons/mob/silicon/cameramob.dmi'
	invisibility = INVISIBILITY_MAXIMUM
	hud_possible = list(ANTAG_HUD, AI_DETECT_HUD = HUD_LIST_LIST)
	var/list/visibleCameraChunks = list()
	var/mob/living/silicon/hl13/dispatch/dp = null
	var/relay_speech = FALSE
	var/use_static = TRUE
	var/static_visibility_range = 16
	interaction_range = INFINITY

/mob/camera/dp_eye/Initialize(mapload)
	. = ..()
	setLoc(loc, TRUE)

/mob/camera/dp_eye/proc/setLoc(destination, force_update = FALSE)
	if(dp)
		if(!isturf(dp.loc))
			return
		destination = get_turf(destination)
		if(!force_update && (destination == get_turf(src)) )
			return //we are already here!
		if (destination)
			abstract_move(destination)
		else
			moveToNullspace()
		if(use_static)
			dp.camera_visibility(src)
		if(dp.client)
			dp.client.set_eye(src)
		update_parallax_contents()

/mob/living/silicon/hl13/dispatch/proc/create_eye()
	if(eyeobj)
		return
	eyeobj = new /mob/camera/dp_eye()
	all_eyes += eyeobj
	eyeobj.dp = src
	eyeobj.setLoc(loc)
	eyeobj.name = "[name] (Dispatch Eye)"
	eyeobj.real_name = eyeobj.name
	set_eyeobj_visible(TRUE)

/mob/living/silicon/hl13/dispatch/proc/set_eyeobj_visible(state = TRUE)
	if(!eyeobj)
		return
	eyeobj.mouse_opacity = state ? MOUSE_OPACITY_ICON : initial(eyeobj.mouse_opacity)
	eyeobj.invisibility = state ? INVISIBILITY_OBSERVER : initial(eyeobj.invisibility)

/client/proc/DPMove(n, direct, mob/living/silicon/hl13/dispatch/user)

	var/initial = initial(user.sprint)
	var/max_sprint = 50

	if(user.cooldown && user.cooldown < world.timeofday) // 3 seconds
		user.sprint = initial

	for(var/i = 0; i < max(user.sprint, initial); i += 20)
		var/turf/step = get_turf(get_step(user.eyeobj, direct))
		if(step)
			user.eyeobj.setLoc(step)

	user.cooldown = world.timeofday + 5
	if(user.acceleration)
		user.sprint = min(user.sprint + 0.5, max_sprint)
	else
		user.sprint = initial

/mob/camera/dp_eye/proc/GetViewerClient()
	if(dp)
		return dp.client
	return null

/mob/camera/dp_eye/Destroy()
	if(dp)
		dp.all_eyes -= src
		dp = null
	for(var/V in visibleCameraChunks)
		var/datum/camerachunk/c = V
		c.remove(src)
	return ..()

