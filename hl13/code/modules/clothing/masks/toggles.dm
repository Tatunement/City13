#define COMSIG_HANDLE_NIGHT_VISION "handle_night_vision"
#define MASK_CAMERA_BUFFER 0.5 SECONDS

/obj/item/clothing/mask/gas/hl13/combine
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|HIDEFACIALHAIR|HIDESNOUT|HIDEHAIR
	///False because their vision shouldnt be undermined by the mask
	has_fov = FALSE
	///Setting the hud_type we want the mask to generate
	var/hud_type = /obj/item/clothing/glasses/hud/hl13/combine/cp/night
	var/obj/machinery/camera/hl13/combine/camera = null
	var/camera_c_tag = "404"
	var/wearer = null

/obj/item/clothing/mask/gas/hl13/combine/Initialize(mapload)
	. = ..()
	RegisterSignal(src, COMSIG_HANDLE_NIGHT_VISION, PROC_REF(handle_nv))
	RegisterSignal(src,COMSIG_OUTFIT_MASK_EQUIP,PROC_REF(create_camera))

/obj/item/clothing/mask/gas/hl13/combine/equipped(mob/living/carbon/human/M, slot)
	. = ..()
	remove_camera()
	if(slot != ITEM_SLOT_MASK) //TODO: AVOID PUTTING ON THE MASK IF THE EYE SLOT IS OCCUPIED
		return
	if(!isnull(M.glasses)) {
		to_chat(M, span_notice("You unequipped your glasses to let the mask fit."))
		M.equip_to_slot_if_possible(M.glasses, ITEM_SLOT_HANDS, 0, 0, 1)
		M.glasses = null
	}
	create_hud(M, slot)
	create_camera(M)

/obj/item/clothing/mask/gas/hl13/combine/dropped(mob/M)
	. = ..()
	wearer = null
	remove_hud(M)
	remove_camera()
	create_camera()

/obj/item/clothing/mask/gas/hl13/combine/proc/create_hud(mob/living/carbon/human/M, slot)
	if(ishuman(M))
		var/obj/item/clothing/glasses/hud/hl13/hud = new hud_type(loc)
		ADD_TRAIT(hud, TRAIT_NODROP, TRAIT_GENERIC)
		M.equip_to_slot_if_possible(hud, ITEM_SLOT_EYES, 0, 0, 1)

/obj/item/clothing/mask/gas/hl13/combine/proc/remove_camera()
	if(camera)
		UnregisterSignal(src, COMSIG_CAMERA_MOVE)
		QDEL_NULL(camera)
	else
		return

/obj/item/clothing/mask/gas/hl13/combine/proc/create_camera(mob/living/carbon/human/M)
	if(M)
		RegisterSignal(src, COMSIG_CAMERA_MOVE, PROC_REF(camera_update))
		wearer = M
		camera = new(M)
		camera.c_tag = "[M.job] [camera_c_tag]"
	if(!M)
		camera = new(src)
		camera.c_tag = "[M.job] [camera_c_tag]"

/obj/item/clothing/mask/gas/hl13/combine/Move()
	. = ..()
	if(!wearer)
		camera_update()

/obj/item/clothing/mask/gas/hl13/combine/proc/camera_update()
	SIGNAL_HANDLER
	GLOB.cameranet.updatePortableCamera(camera, MASK_CAMERA_BUFFER)

/obj/item/clothing/mask/gas/hl13/combine/proc/remove_hud(mob/living/carbon/human/M)
	handle_nv(M.wear_mask, FALSE, M)
	if(istype(M.glasses, /obj/item/clothing/glasses/hud/hl13/combine/))
		QDEL_NULL(M.glasses)

/obj/item/clothing/mask/gas/hl13/combine/proc/handle_nv(mask, night_vision, mob/living/carbon/human/user)
	SIGNAL_HANDLER
	var/nv = night_vision
	if(nv) {
		icon_state = "[icon_state]_nv"
		worn_icon_state = "[worn_icon_state]_nv"
		inhand_icon_state = "[inhand_icon_state]_nv"
		user.glasses.color_cutoffs = user.glasses.color_cutoff_to_set
		user.glasses.flash_protect = FLASH_PROTECTION_SENSITIVE
		ADD_TRAIT(user, TRAIT_SEE_GLASS_COLORS, GLASSES_TRAIT)
		to_chat(user, span_notice("You turned Night Vision on."))
	} else {
		icon_state = initial(icon_state)
		worn_icon_state = initial(icon_state)
		inhand_icon_state = initial(icon_state)
		if (user.glasses) {
			user.glasses.color_cutoffs = initial(user.glasses.color_cutoffs)
			user.glasses.flash_protect = FLASH_PROTECTION_FLASH
		}
		REMOVE_TRAIT(user, TRAIT_SEE_GLASS_COLORS, GLASSES_TRAIT)
		to_chat(user, span_notice("You turned the Night Vision off."))
	}
	user.update_sight()
	update_slot_icon()
	user.update_glasses_color(user.glasses, TRUE)

/obj/item/clothing/glasses/hud/hl13/combine/
	actions_types = list(/datum/action/item_action/toggle_night_vision)
	var/night_vision = FALSE

/obj/item/clothing/glasses/examine(mob/user)
	. = ..()
	if(glass_colour_type && !forced_glass_color && ishuman(user))
		. -= span_notice("Alt-click to toggle [p_their()] colors.")

/obj/item/clothing/glasses/hud/hl13/combine/AltClick(mob/user)
	return

/obj/item/clothing/glasses/hud/hl13/combine/Destroy()
	. = ..()
	night_vision = FALSE

/obj/item/clothing/glasses/hud/hl13/combine/ui_action_click(mob/living/carbon/human/user, datum/action/item_action/actiontype)
	if(istype(actiontype, /datum/action/item_action/toggle_night_vision))
		night_vision = !night_vision
		if (night_vision)
			icon_state = "[icon_state]_nv"
		else
			icon_state = initial(icon_state)
		actiontype.button_icon_state = icon_state
		actiontype.build_all_button_icons()
		SEND_SIGNAL(user.wear_mask, COMSIG_HANDLE_NIGHT_VISION, night_vision, user)

#undef MASK_CAMERA_BUFFER
