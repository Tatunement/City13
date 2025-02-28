/obj/item/clothing/gloves/hl13
	hl13_flag = TRUE
	icon = 'hl13/icons/obj/clothing/gloves.dmi'
	lefthand_file = 'hl13/icons/mob/inhands/clothing/gloves_lefthand.dmi'
	righthand_file = 'hl13/icons/mob/inhands/clothing/gloves_righthand.dmi'
	worn_icon = 'hl13/icons/mob/clothing/hands.dmi'


/obj/item/clothing/gloves/hl13/cp_gloves
	name = "civil protection gloves"
	desc = "These tactical gloves are fireproof and electrically insulated."
	icon_state = "leather_gloves"
	greyscale_colors = "#2f2e31" //TODO: ask takyon if he wants to use his gloves or this greyscale thing its okay!
	siemens_coefficient = 0
	strip_delay = 80
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = NONE
	armor_type = /datum/armor/gloves_combat

/obj/item/clothing/gloves/hl13/fingerless
	name = "fingerless gloves"
	desc = "Plain green gloves without fingertips for the hard working."
	icon_state = "fingerless_gloves"
	strip_delay = 40
	equip_delay_other = 20
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	undyeable = TRUE
	clothing_traits = list(TRAIT_FINGERPRINT_PASSTHROUGH)
