#define COMP_TIMEPIECE_TWENTYFOUR_HOUR "24-Hour"
#define COMP_TIMEPIECE_TWELVE_HOUR "12-Hour"
#define COMP_TIMEPIECE_MINUTES "Minutes"
#define COMP_TIMEPIECE_HOURS "Hours"

/**
 * # Timepiece Component
 *
 * returns the current station time.
 */
/obj/item/circuit_component/timepiece
	display_name = "Timepiece"
	desc = "A component that outputs the current station time. The text output port is used for time formats while the numerical output port is used for units of time."
	category = "Utility"
	circuit_flags = CIRCUIT_FLAG_INPUT_SIGNAL|CIRCUIT_FLAG_OUTPUT_SIGNAL

	/// The time format of the text output
	var/datum/port/input/option/format
	/// The unit of time for the numerical output
	var/datum/port/input/option/time_unit
	/// The output for 24/12 hour formats
	var/datum/port/output/text_output
	/// seconds, minutes, hours.
	var/datum/port/output/num_output

/obj/item/circuit_component/timepiece/populate_ports()
	text_output = add_output_port("Time Format", PORT_TYPE_STRING)
	num_output = add_output_port("Unit of Time", PORT_TYPE_NUMBER)

/obj/item/circuit_component/timepiece/populate_options()
	var/static/format_options = list(
		COMP_TIMEPIECE_TWENTYFOUR_HOUR, // Station time is expressed in 24-h in the status tab. So this is the default.
		COMP_TIMEPIECE_TWELVE_HOUR,
	)
	format = add_option_port("Time Format", format_options)
	var/static/unit_options = list(
		COMP_TIMEPIECE_HOURS,
		COMP_TIMEPIECE_MINUTES,
	)
	time_unit = add_option_port("Unit of Time", unit_options)

/obj/item/circuit_component/timepiece/input_received(datum/port/input/port)
	var/time

	switch(format.value)
		if(COMP_TIMEPIECE_TWENTYFOUR_HOUR)
			time = SSday_night.get_twentyfourhour_timestamp()
		if(COMP_TIMEPIECE_TWELVE_HOUR)
			time = SSday_night.get_twelvehour_timestamp()

	text_output.set_output(time)

	switch(time_unit.value)
		if(COMP_TIMEPIECE_HOURS)
			time = SSday_night.current_hour
		if(COMP_TIMEPIECE_MINUTES)
			time = SSday_night.current_minute

	num_output.set_output(time)

#undef COMP_TIMEPIECE_TWENTYFOUR_HOUR
#undef COMP_TIMEPIECE_TWELVE_HOUR
#undef COMP_TIMEPIECE_MINUTES
#undef COMP_TIMEPIECE_HOURS
