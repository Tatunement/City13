/obj/machinery/autolathe/hl13/fabricator
	icon = 'hl13/icons/obj/combine.dmi'
	icon_state = "fabricator"
	name = "fabricator"

/obj/machinery/autolathe/hl13/fabricator/Initialize(mapload)
	AddComponent(/datum/component/material_container, SSmaterials.materials_by_category[MAT_CATEGORY_ITEM_MATERIAL], 0, MATCONTAINER_EXAMINE, _after_insert = CALLBACK(src, PROC_REF(AfterMaterialInsert)))
	. = ..()
	wires = new /datum/wires/autolathe(src)
	if(!GLOB.autounlock_techwebs[/datum/techweb/autounlocking/fabricator])
		GLOB.autounlock_techwebs[/datum/techweb/autounlocking/fabricator] = new /datum/techweb/autounlocking/fabricator
	stored_research = GLOB.autounlock_techwebs[/datum/techweb/autounlocking/fabricator]
