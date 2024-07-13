/mob/living/silicon/hl13/dispatch/ClickOn(atom/A, params)
	if(world.time <= next_click)
		return
	next_click = world.time + 1

	var/list/modifiers = params2list(params)

	if(SEND_SIGNAL(src, COMSIG_MOB_CLICKON, A, modifiers) & COMSIG_MOB_CANCEL_CLICKON)
		return

	if(!can_interact_with(A))
		return

	if(check_click_intercept(params,A))
		return

	if(incapacitated())
		return

	var/turf/pixel_turf = get_turf_pixel(A)
	if(isnull(pixel_turf))
		return

	A.attack_dispatch(src)

/atom/proc/attack_dispatch(mob/user) //used for when dispatch interacts with items
	return
