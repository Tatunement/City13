/obj/projectile/bullet/hl13
	icon = 'hl13/icons/obj/weapons/guns/projectiles.dmi'
	name = "bullet"
	icon_state = "bullet"
	damage = 60
	damage_type = BRUTE
	armor_flag = BULLET
	hitsound_wall = SFX_RICOCHET
	sharpness = SHARP_POINTY
	impact_effect_type = /obj/effect/temp_visual/impact_effect
	shrapnel_type = /obj/item/shrapnel/bullet
	embedding = list(embed_chance=20, fall_chance=2, jostle_chance=0, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.5, pain_mult=3, rip_time=10)
	wound_bonus = 0
	wound_falloff_tile = -5
	embed_falloff_tile = -3

/obj/projectile/bullet/hl13/pulse
	name = "Dark Energy Pulse"
	icon_state = "pulse_bullet"
	damage = 8
	embedding = list(embed_chance=15, fall_chance=3, jostle_chance=4, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.4, pain_mult=5, jostle_pain_mult=6, rip_time=10)
	icon = 'hl13/icons/obj/weapons/guns/projectiles.dmi'

