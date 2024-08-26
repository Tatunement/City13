/obj/item/melee/baton/security/hl13
	icon = 'hl13/icons/obj/weapons/melee/baton.dmi'
	lefthand_file =  'hl13/icons/obj/weapons/melee/baton_lefthand.dmi'
	righthand_file =  'hl13/icons/obj/weapons/melee/baton_righthand.dmi'
	icon_state = "stun_baton"
	inhand_icon_state = "baton"
	worn_icon_state = "baton"
	cell = /obj/item/stock_parts/cell/hl13
	hl13_flag = TRUE


/obj/item/melee/baton/security/hl13/proc/update_inhand_icon_state()
	if(active)
		inhand_icon_state = "[initial(inhand_icon_state)]_active"
		return
	inhand_icon_state = "[initial(inhand_icon_state)]"


/obj/item/melee/baton/security/hl13/attack_self(mob/user)
	if(cell?.charge >= cell_hit_cost)
		active = !active
		balloon_alert(user, "turned [active ? "on" : "off"]")
		playsound(src, HL13_SFX_STUNBATON_SPARK, 75, FALSE, -1)
	else
		active = FALSE
		if(!cell)
			balloon_alert(user, "no power source!")
		else
			balloon_alert(user, "out of charge!")
	update_appearance()
	update_inhand_icon_state()
	add_fingerprint(user)

/obj/item/melee/baton/security/hl13/finalize_baton_attack(mob/living/target, mob/living/user, modifiers, in_attack_chain = TRUE)
	if(!in_attack_chain && HAS_TRAIT_FROM(target, TRAIT_IWASBATONED, REF(user)))
		return BATON_ATTACK_DONE

	cooldown_check = world.time + cooldown
	if(on_stun_sound)
		playsound(get_turf(src), randomize_sound("flesh"), on_stun_volume, FALSE, -1)
	if(user)
		target.lastattacker = user.real_name
		target.lastattackerckey = user.ckey
		target.LAssailant = WEAKREF(user)
		if(log_stun_attack)
			log_combat(user, target, "stun attacked", src)
	if(baton_effect(target, user, modifiers) && user)
		set_batoned(target, user, cooldown)

/obj/item/melee/baton/security/hl13/proc/randomize_sound(soundin)
	if(istext(soundin))
		if(soundin == "flesh")
			soundin = pick('hl13/sound/weapons/melee/stun_baton/stunstick_fleshhit2.ogg', 'hl13/sound/weapons/melee/stun_baton/stunstick_fleshhit1.ogg')
		if(soundin == "shield")
			soundin = pick('hl13/sound/weapons/melee/stun_baton/stunstick_impact2.ogg', 'hl13/sound/weapons/melee/stun_baton/stunstick_impact1.ogg')
	return soundin

/obj/item/melee/baton/security/hl13/deductcharge(deducted_charge)
	if(!cell)
		return
	//Note this value returned is significant, as it will determine
	//if a stun is applied or not
	. = cell.use(deducted_charge)
	if(active && cell.charge < cell_hit_cost)
		//we're below minimum, turn off
		active = FALSE
		update_appearance()
		update_inhand_icon_state()
		playsound(src, HL13_SFX_STUNBATON_SPARK, 75, FALSE, -1)

/obj/item/melee/baton/security/hl13/check_parried(mob/living/carbon/human/human_target, mob/living/user)
	if(!ishuman(human_target))
		return
	if (human_target.check_shields(src, 0, "[user]'s [name]", MELEE_ATTACK))
		playsound(human_target, randomize_sound("shield"), 50, FALSE)
		return TRUE
	if(check_martial_counter(human_target, user))
		return TRUE
