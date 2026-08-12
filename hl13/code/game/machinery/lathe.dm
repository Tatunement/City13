/obj/machinery/hl13/lathe
	name = "lathe"
	density = TRUE
	active_power_usage = 0
	icon_state = "mechfab1"
	var/list/constructable_items = list(
		/obj/item/gun/ballistic/automatic/hl13/mp7/luty/no_mag,
		/obj/item/gun/ballistic/automatic/hl13/usp/zip/no_mag,)
	var/selected_item = 1

/obj/machinery/hl13/lathe/ui_interact(mob/user, datum/tgui/ui)
  ui = SStgui.try_update_ui(user, src, ui)
  if(!ui)
    ui = new(user, src, "Lathe")
    ui.open()

/obj/machinery/hl13/lathe/ui_act(action, params)
	. = ..()
	if(.)
		to_chat(world, span_boldannounce("[selected_item]"))
		return FALSE
	if(action == "start_lathe")
		playsound(src, 'hl13/sound/computer/combine_button2.ogg',40)
		to_chat(world, span_boldannounce("[selected_item]"))
		var/constructing_item = constructable_items[selected_item]
		new constructing_item(src.loc)
		to_chat(world, span_boldannounce("[selected_item]"))
		return TRUE
	if(action == "next")
		if(constructable_items.len != selected_item)
			selected_item += 1
			to_chat(world, span_boldannounce("[selected_item]"))
			return TRUE
		else
			selected_item = 1
			to_chat(world, span_boldannounce("[selected_item]"))
			return TRUE
	return FALSE

/obj/machinery/hl13/lathe/ui_data(mob/user)
	var/list/data = list()
	data["selected_item_name"] = constructable_items[selected_item].name

	return data
