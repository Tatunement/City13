/obj/structure/hl13/scrapile
	icon = 'hl13/icons/obj/scrap.dmi'
	icon_state = "scrap_pile1"
	var/recharge_cap = 12
	var/uses_before_recharge = 12

/obj/structure/hl13/scrapile/attack_hand(mob/user)
	if(uses_before_recharge != 0)
		to_chat(user, span_notice("You start searching threw the scrap pile..."))
		if(!do_after(user, 1.5 SECONDS, target = user))
			return
		var/given_loot = loot()
		usr.put_in_hands(new given_loot)
		uses_before_recharge -= 1

	if(uses_before_recharge == 0)
		addtimer(CALLBACK(src, PROC_REF(recharge)), 100)

	if(uses_before_recharge < (recharge_cap/4)*3)
		icon_state = "scrap_pile2"
	if(uses_before_recharge < (recharge_cap/4)*3)
		icon_state = "scrap_pile2"
	if(uses_before_recharge < (recharge_cap/4)*2)
		icon_state = "scrap_pile3"
	if(uses_before_recharge < recharge_cap/4)
		icon_state = "scrap_pile4"

/obj/structure/hl13/scrapile/Initialize(mapload)//scrap piles spawn maxed out
	uses_before_recharge = recharge_cap
	. = ..()

/obj/structure/hl13/scrapile/proc/recharge()
	uses_before_recharge += 1
	if(uses_before_recharge > recharge_cap)
		uses_before_recharge = recharge_cap

/obj/structure/hl13/scrapile/examine(mob/user)
	. = ..()
	. += "There's [uses_before_recharge] uses before its empty."
	if(uses_before_recharge == 0)
		. += "There is no scrap left."

/obj/structure/hl13/scrapile/proc/loot()
	var/scrap = rand(1,120)
	var/loot
	switch(scrap)
		if(1)
			loot = /obj/item/weldingtool/hl13/scrap
		if(2)
			loot = /obj/item/crowbar/hl13/scrap
		if(3)
			loot = /obj/item/screwdriver/hl13/scrap
		if(4)
			loot = /obj/item/wirecutters/hl13/scrap
		if(5)
			loot = /obj/item/wrench/hl13/scrap
		if(6 to 120)
			loot = /obj/item/stack/sheet/hl13/scrap_metal
	return loot
