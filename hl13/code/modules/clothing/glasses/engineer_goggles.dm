#define MODE_NONE ""
#define MODE_MESON "meson"
#define MODE_TRAY "t-ray"

/obj/item/clothing/glasses/hl13/combine_worker
	name = "Combine worker eye piece"
	icon = 'hl13/icons/obj/clothing/glasses.dmi'
	icon_state = "cw_visor"
	hl13_flag = TRUE
	actions_types = list(/datum/action/item_action/toggle_mode)
	flash_protect = FLASH_PROTECTION_WELDER
	var/worker_vision = FALSE

	var/list/modes = list(MODE_NONE = MODE_MESON, MODE_MESON = MODE_TRAY, MODE_TRAY = MODE_NONE)
	var/mode = MODE_NONE
	var/range = 1
	var/list/connection_images = list()
	var/combine_mask

/obj/item/clothing/glasses/hl13/combine_worker/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/update_icon_updates_onmob, ITEM_SLOT_EYES)
	START_PROCESSING(SSobj, src)
	update_appearance()
/obj/item/clothing/glasses/meson/engine/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()
/obj/item/clothing/glasses/hl13/combine_worker/proc/toggle_mode(mob/user)
	mode = modes[mode]
	to_chat(user, "You switch modes")
	if(connection_images.len)
		connection_images.Cut()
	switch(mode)
		if(MODE_MESON)
			worker_vision = TRUE
			to_chat(user, "displaying meson")
			vision_flags = SEE_TURFS
			color_cutoffs = list(15, 12, 0)
			icon_state = "cw_visor_wv"
			change_glass_color(user, /datum/client_colour/glass_colour/yellow)
			mask_state(user)
		if(MODE_TRAY)
			to_chat(user, "displaying t-ray")
			vision_flags = NONE
			color_cutoffs = list(0,0,0)
			change_glass_color(user, /datum/client_colour/glass_colour/lightblue)
		if(MODE_NONE)
			worker_vision = FALSE
			to_chat(user, "displaying nothing")
			icon_state = "cw_visor"
			vision_flags = NONE
			mask_state(user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.glasses == src)
			H.update_sight()
	update_appearance()
	update_item_action_buttons()

/obj/item/clothing/glasses/hl13/combine_worker/attack_self(mob/user)
	toggle_mode(user)

/obj/item/clothing/glasses/hl13/combine_worker/process()
	if(!ishuman(loc))
		return
	var/mob/living/carbon/human/user = loc
	if(user.glasses != src || !user.client)
		return
	if(mode==MODE_TRAY)
		t_ray_scan(user, 8, range)

/obj/item/clothing/glasses/hl13/combine_worker/proc/mask_state(mob/living/carbon/user)
	if(worker_vision)
		user.wear_mask.icon_state = "ec_mask_cw_wv"
		user.wear_mask.worn_icon_state = "ec_mask_cw_wv"
	else
		user.wear_mask.icon_state = "ec_mask_cw"
		user.wear_mask.worn_icon_state = "ec_mask_cw"
	user.wear_mask.update_slot_icon()
	update_appearance()
