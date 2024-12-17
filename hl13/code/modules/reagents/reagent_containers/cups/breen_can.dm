/obj/item/reagent_containers/cup/soda_cans/hl13
	icon = 'hl13/icons/obj/food/food.dmi'
	var/icon_open = null
	fizziness = FALSE

/obj/item/reagent_containers/cup/soda_cans/hl13/open_soda(mob/user)
	to_chat(user, "You pull back the tab of [src] with a pop.")
	reagents.flags |= OPENCONTAINER
	playsound(src, SFX_CAN_OPEN, 50, TRUE)
	spillable = TRUE
	throwforce = 0
	icon_state = icon_open //sets icon to a opened varinent

/obj/item/reagent_containers/cup/soda_cans/hl13/breen_blue
	name = "dr>breen's private reserve"
	icon_open = "breen_can_open"
	icon_state = "breen_can"
	list_reagents = list(/datum/reagent/consumable/hl13/breenblue = 29)

/obj/item/reagent_containers/cup/soda_cans/hl13/breen_blue/empty
	name = "dr>breen's private reserve"
	icon_state = "breen_can_open"
	spillable = TRUE
	list_reagents = list(/datum/reagent/consumable/hl13/breenblue = 0)

/obj/item/reagent_containers/cup/soda_cans/hl13/breen_blue/empty/Initialize(mapload, vol)
	. = ..()
	reagents.flags |= OPENCONTAINER

/obj/item/reagent_containers/cup/soda_cans/hl13/breen_red
	name = "dr>breen's private reserve"
	icon_open = "breen_can_red_open"
	icon_state = "breen_can_red"
	list_reagents = list(/datum/reagent/consumable/hl13/breenred = 50)

/obj/item/reagent_containers/cup/soda_cans/hl13/breen_red/empty
	name = "dr>breen's private reserve"
	icon_state = "breen_can_red_open"
	spillable = TRUE
	list_reagents = list(/datum/reagent/consumable/hl13/breenred = 0)

/obj/item/reagent_containers/cup/soda_cans/hl13/breen_red/empty/Initialize(mapload, vol)
	. = ..()
	reagents.flags |= OPENCONTAINER

/obj/item/reagent_containers/cup/soda_cans/hl13/breen_yellow
	name = "dr>breen's private reserve"
	icon_open = "breen_can_yellow_open"
	icon_state = "breen_can_yellow"
	list_reagents = list(/datum/reagent/consumable/hl13/breenyellow = 50)

/obj/item/reagent_containers/cup/soda_cans/hl13/breen_yellow/empty
	name = "dr>breen's private reserve"
	icon_state = "breen_can_yellow_open"
	spillable = TRUE
	list_reagents = list(/datum/reagent/consumable/hl13/breenyellow = 0)

/obj/item/reagent_containers/cup/soda_cans/hl13/breen_yellow/empty/Initialize(mapload, vol)
	. = ..()
	reagents.flags |= OPENCONTAINER

/obj/item/reagent_containers/cup/soda_cans/hl13/coffee
	name = "Combine Coffee"
	desc = "Combine coffee, found in service rations"
	icon_open = "coffee"
	icon_state = "coffee"
	list_reagents = list(/datum/reagent/consumable/coffee = 50)

//Soup dust
/obj/item/reagent_containers/cup/hl13/sustenance_dust
	name = "Desiccated Sustenance Dust"
	desc = "This packet is found in biotic rations, Can be mixed with water to make a soup"
	var/icon_open = "bar_package_4_open"
	icon_state = "bar_package_4"
	icon = 'hl13/icons/obj/food/food.dmi'
	volume = 1
	list_reagents = list(/datum/reagent/consumable/hl13/sustenance_dust = 1)

/obj/item/reagent_containers/cup/hl13/sustenance_dust/attack_self(mob/user)
	to_chat(user, "You tear the top of the package off.")
	reagents.flags |= OPENCONTAINER
	playsound(loc, 'sound/items/poster_ripped.ogg', 50, TRUE)
	icon_state = icon_open
