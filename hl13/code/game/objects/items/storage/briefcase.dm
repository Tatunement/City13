/obj/item/storage/briefcase/hl13
	icon = 'hl13/icons/obj/storage/cases.dmi'
	lefthand_file = 'hl13/icons/obj/storage/cases_lefthand.dmi'
	righthand_file = 'hl13/icons/obj/storage/cases_righthand.dmi'

/obj/item/storage/briefcase/hl13/citizen
	name = "citizen briefcase"
	desc = "" //TODO add a description
	icon_state = "suitcase"
	inhand_icon_state = "suitcase"

/obj/item/storage/briefcase/hl13/PopulateContents()
	new /obj/item/hl13/coupon/relocation_coupon(src)
