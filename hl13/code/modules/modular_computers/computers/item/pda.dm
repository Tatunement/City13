/obj/item/modular_computer/combine_pda
	name = "Combine PDA"
	icon = 'hl13/icons/obj/radios.dmi'
	icon_state = "CP_RADIO"
	device_theme = PDA_THEME_COMBINE_PDA
	hardware_flag = PROGRAM_TABLET
	slot_flags = ITEM_SLOT_ID | ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_SMALL
	starting_programs = list(
		/datum/computer_file/program/civilian_data,
		/datum/computer_file/program/socio_stability_monitor,
		/datum/computer_file/program/filemanager
	)

/obj/item/modular_computer/combine_pda/install_default_programs()
	SHOULD_CALL_PARENT(FALSE)
	for(var/programs in starting_programs)
		var/datum/computer_file/program/program_type = new programs
		store_file(program_type)


/obj/item/modular_computer/combine_pda/open_program(mob/user, datum/computer_file/program/program)
	if(program.computer != src)
		CRASH("tried to open program that does not belong to this computer")

	if(!program || !istype(program)) // Program not found or it's not executable program.
		to_chat(user, span_danger("\The [src]'s screen shows \"I/O ERROR - Unable to run program\" warning."))
		return FALSE

	// The program is already running. Resume it.
	if(program in idle_threads)
		program.program_state = PROGRAM_STATE_ACTIVE
		active_program = program
		program.alert_pending = FALSE
		idle_threads.Remove(program)
		update_appearance()
		return TRUE

	if(!program.is_supported_by_hardware(hardware_flag, 1, user))
		return FALSE

	if(idle_threads.len > max_idle_programs)
		to_chat(user, span_danger("\The [src] displays a \"Maximal CPU load reached. Unable to run another program.\" error."))
		return FALSE

	if(!program.on_start(user))
		return FALSE

	active_program = program
	program.alert_pending = FALSE
	update_appearance()
	ui_interact(user)
	playsound(user, 'hl13/sound/computer/button17.ogg', 50, TRUE)
	return TRUE
/obj/item/modular_computer/kill_program(forced = FALSE)
	wipe_program(forced)
	var/mob/user = usr
	if(user && istype(user))
		//Here to prevent programs sleeping in destroy
		INVOKE_ASYNC(src, TYPE_PROC_REF(/datum, ui_interact), user) // Re-open the UI on this computer. It should show the main screen now.
	playsound(user, 'hl13/sound/computer/combine_button2.ogg', 50, TRUE)
	update_appearance()
