/obj/item/stack/rubble
	name = "Rubble"
	desc = "It's all that remains.."
	icon = 'hl13/icons/obj/destroyed.dmi'
	base_icon_state = "rubble"
	icon_state = "rubble_1"

/obj/item/stack/rubble/Initialize(mapload)
	. = ..()
	randomize_icon()
	update_appearance()

/obj/item/stack/rubble/proc/randomize_icon()
	icon_state = base_icon_state + "_[rand(1,3)]"
