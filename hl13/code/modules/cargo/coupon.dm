/obj/item/hl13/coupon
	name = "coupon"
	desc = "It doesn't matter if you didn't want it before, what matters now is that you've got a coupon for it!"
	item_flags = NOBLUDGEON
	w_class = WEIGHT_CLASS_TINY
	icon = 'hl13/icons/obj/coupon.dmi'


/obj/item/hl13/coupon/relocation_coupon
	name = "relocation coupon"
	desc = "A coupon to relocate to city 13."
	icon_state = "relocation_coupon"
	is_coupon = TRUE
	//This holds the card assignment so when they come into town they can get a card
	var/role_assignment = "without assignment"
	var/recorded_name = "Without recorded name"
	var/trim_coupon = /datum/id_trim/job/citizen
	var/list/access_coupon = list(ACCESS_RATION_STANDARD)
	var/recorded_age = "unknown"
	var/starting_ration_unit = 2


