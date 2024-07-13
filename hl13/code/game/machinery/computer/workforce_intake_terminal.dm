/obj/machinery/computer/hl13/combine_terminal/workforce_terminal
	name = "Workforce intake terminal"
	desc = "A terminal meant for printing IDs"
	icon = 'hl13/icons/obj/worker_intake_terminal.dmi'
	icon_state = "wf-terminal"
	circuit = /obj/item/circuitboard/computer/hl13/workforce_terminal
	var/coupon_inserted = FALSE
	var/stored_coupon = null

	//Job coupon variables
	var/coupon_role_assignment
	var/coupon_recorded_name
	var/id_trim
	var/coupon_age


	//stored coupon
	var/obj/item/hl13/coupon/relocation_coupon/coupon

/obj/machinery/computer/hl13/combine_terminal/workforce_terminal/attackby(obj/item/attacking_item, mob/user)
	if(attacking_item.is_coupon==FALSE)
		return
	if(coupon_inserted)
		return
	else
		attacking_item.forceMove(src)
		coupon = attacking_item
		to_chat(user, span_notice("You insert the [attacking_item] into the coupon reader."))
		playsound(src, 'sound/machines/terminal_insert_disc.ogg', 50, FALSE)
		coupon_role_assignment = coupon.role_assignment
		coupon_recorded_name = coupon.recorded_name

		id_trim = coupon.trim_coupon
		coupon_age = coupon.recorded_age
		stored_coupon = attacking_item
		coupon_inserted = TRUE

/obj/machinery/computer/hl13/combine_terminal/workforce_terminal/attack_dispatch(mob/user)
	ui_interact(user)

/obj/machinery/computer/hl13/combine_terminal/workforce_terminal/ui_interact(mob/user, datum/tgui/ui)
	. = ..()
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "WorkforceTerminal")
		ui.open()

/obj/machinery/computer/hl13/combine_terminal/workforce_terminal/proc/makeID()
	var/obj/item/card/id/advanced/hl13/newID = new(loc)

	newID.assignment = coupon_role_assignment
	newID.registered_name = coupon_recorded_name
	newID.trim = id_trim

	newID.update_label()
	newID.update_icon()

/obj/machinery/computer/hl13/combine_terminal/workforce_terminal/ui_act(action, list/params)
	. = ..()
	if(.)
		return
	switch(action)
		if("eject_coupon")
			if(coupon_inserted == FALSE)
				return
			else
				coupon.forceMove(drop_location())
				coupon_role_assignment = null
				coupon_recorded_name = null
				id_trim = null
				coupon_inserted = FALSE
				stored_coupon = null
				coupon_age = null
		if("printid")
			if(coupon_inserted == FALSE)
				return
			else
				makeID()
				new /datum/record/crew(name = coupon_recorded_name, age = coupon_age, rank = coupon_role_assignment)
				coupon_role_assignment = null
				coupon_recorded_name = null
				id_trim = null
				coupon_inserted = FALSE
				stored_coupon = null
				coupon_age = null
/obj/machinery/computer/hl13/combine_terminal/workforce_terminal/ui_data(mob/user)
	. = ..()
	var/list/data = list()
	var/coupon_inserted_text = "Error"
	if(coupon_inserted == TRUE)
		coupon_inserted_text = "Coupon inserted"
	else
		coupon_inserted_text = "No coupon inserted"
	data["inserted_coupon"] = coupon_inserted_text
	data["name"] = coupon_recorded_name
	data["age"] = coupon_age
	return data
