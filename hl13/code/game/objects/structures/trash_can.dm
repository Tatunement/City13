
//hl13 start kind of a structure
/obj/item/storage/trash_can
	name = "trash can"
	desc = "A green city trash can. 'Pick up that can!' "
	icon = 'hl13/icons/obj/citydecorations.dmi'
	icon_state = "trash_can"
	density = 1
	anchored = TRUE

/obj/item/storage/trash_can/Initialize(mapload)
	. = ..()
	atom_storage.max_specific_storage = WEIGHT_CLASS_HUGE
	atom_storage.max_total_storage = 14

/obj/item/storage/trash_can/hitby(atom/movable/AM, skipcatch, hitpush, blocked, datum/thrownthing/throwingdatum)
	if(isitem(AM) && AM.CanEnterDisposals())
		if((throwingdatum.thrower && HAS_TRAIT(throwingdatum.thrower, TRAIT_THROWINGARM)) || prob(75))
			AM.forceMove(src)
			visible_message(span_notice("[AM] lands in [src]."))
			update_appearance()
		else
			visible_message(span_notice("[AM] bounces off of [src]'s rim!"))
			return ..()
	else
		return ..()
