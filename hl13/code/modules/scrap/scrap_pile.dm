/obj/structure/hl13/scrapile
	icon = 'hl13/icons/obj/scrap.dmi'
	icon_state = "scrap_pile1"

/obj/structure/hl13/scrapile/attack_hand(mob/user)
	to_chat(user, span_notice("You start searching threw the scrap pile..."))
	(!do_after(user, 1.5 SECONDS, target = user))
	usr.put_in_hands(new /obj/item/stack/sheet/hl13/scrap_metal)
