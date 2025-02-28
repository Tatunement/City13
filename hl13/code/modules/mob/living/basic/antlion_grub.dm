/mob/living/basic/hl13/antlion_grub
	name = "Antlion Grub"
	icon = 'hl13/icons/mob/simple/antlion.dmi'
	base_icon_state = "grub"
	icon_state = "grub"
	icon_dead = "grub-dead"
	icon_living = "grub"

	density = FALSE
	mob_size = MOB_SIZE_SMALL
	health = 1
	maxHealth = 1

	var/obj/effect/dummy/lighting_obj/grub_light

/mob/living/basic/hl13/antlion_grub/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/squashable, squash_chance = 100, squash_damage = 1)
	var/static/list/grub_drops = list(/obj/effect/decal/cleanable/insectguts, /obj/item/reagent_containers/hl13/medkit/grub_guts)
	AddElement(/datum/element/death_drops, grub_drops)
	grub_light = src.mob_light()
	grub_light.set_light_range_power_color(2, 2, "#d4eb71")

/mob/living/basic/hl13/antlion_grub/death()
	. = ..()
	QDEL_NULL(grub_light)
	var/i = rand(1,3)
	layer = MOB_LAYER-1
	switch(i)
		if(1)
			playsound(src,"hl13/sound/npc/antlion_grub/agrub_squish1.ogg",50)
		if(2)
			playsound(src,"hl13/sound/npc/antlion_grub/agrub_squish2.ogg",50)
		if(3)
			playsound(src,"hl13/sound/npc/antlion_grub/agrub_squish3.ogg",50)
