/obj/machinery/hl13/refiner
	name = "Combine refiner"
	icon = 'hl13/icons/obj/combine.dmi'
	icon_state = "refiner_open"
	density = TRUE
	var/shake_time = 40
	var/smelt_amount

/obj/machinery/hl13/refiner/attackby(var/obj/item/stack/sheet/W, mob/user, params)//smelts scrap sheets
	smelt_amount = W.amount
	if(istype(W, /obj/item/stack/sheet/hl13/scrap_metal))
		icon_state = "refiner_closed"
		qdel(W)
		playsound(loc, 'hl13/sound/ambient/fire/fire_big_loop1.ogg', 50, TRUE)
		shake_for(shake_time)
		addtimer(CALLBACK(src, PROC_REF(process_scrap)), shake_time)
	..()

/obj/machinery/hl13/refiner/attackby(var/obj/item/W, mob/user, params)//smelts tools
	if(istype(W, /obj/item/weldingtool/hl13/scrap))
		smelt_amount = 3
		icon_state = "refiner_closed"
		qdel(W)
		playsound(loc, 'hl13/sound/ambient/fire/fire_big_loop1.ogg', 50, TRUE)
		shake_for(shake_time)
		addtimer(CALLBACK(src, PROC_REF(process_scrap)), shake_time)
	if(istype(W, /obj/item/crowbar/hl13/scrap))
		smelt_amount = 3
		icon_state = "refiner_closed"
		qdel(W)
		playsound(loc, 'hl13/sound/ambient/fire/fire_big_loop1.ogg', 50, TRUE)
		shake_for(shake_time)
		addtimer(CALLBACK(src, PROC_REF(process_scrap)), shake_time)
	if(istype(W, /obj/item/screwdriver/hl13/scrap))
		smelt_amount = 3
		icon_state = "refiner_closed"
		qdel(W)
		playsound(loc, 'hl13/sound/ambient/fire/fire_big_loop1.ogg', 50, TRUE)
		shake_for(shake_time)
		addtimer(CALLBACK(src, PROC_REF(process_scrap)), shake_time)
	if(istype(W, /obj/item/wirecutters/hl13/scrap))
		smelt_amount = 3
		icon_state = "refiner_closed"
		qdel(W)
		playsound(loc, 'hl13/sound/ambient/fire/fire_big_loop1.ogg', 50, TRUE)
		shake_for(shake_time)
		addtimer(CALLBACK(src, PROC_REF(process_scrap)), shake_time)
	if(istype(W, /obj/item/wrench/hl13/scrap))
		smelt_amount = 3
		icon_state = "refiner_closed"
		qdel(W)
		playsound(loc, 'hl13/sound/ambient/fire/fire_big_loop1.ogg', 50, TRUE)
		shake_for(shake_time)
		addtimer(CALLBACK(src, PROC_REF(process_scrap)), shake_time)
	..()

/obj/machinery/hl13/refiner/proc/process_scrap()
	icon_state = "refiner_open"
	new/obj/item/stack/sheet/hl13/steel_sheet(src.loc, smelt_amount)

/obj/machinery/hl13/refiner/proc/start_shaking()
	var/static/list/transforms
	if(!transforms)
		var/matrix/M1 = matrix()
		var/matrix/M2 = matrix()
		var/matrix/M3 = matrix()
		var/matrix/M4 = matrix()
		M1.Translate(-1, 0)
		M2.Translate(0, 1)
		M3.Translate(1, 0)
		M4.Translate(0, -1)
		transforms = list(M1, M2, M3, M4)
	animate(src, transform=transforms[1], time=0.4, loop=-1)
	animate(transform=transforms[2], time=0.2)
	animate(transform=transforms[3], time=0.4)
	animate(transform=transforms[4], time=0.6)

/obj/machinery/hl13/refiner/proc/shake_for(duration)
	start_shaking() //start shaking
	addtimer(CALLBACK(src, PROC_REF(stop_shaking)), duration)

/obj/machinery/hl13/refiner/proc/stop_shaking()
	update_appearance()
	animate(src, transform = matrix())
