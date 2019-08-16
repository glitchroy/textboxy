/// @desc Scribble event. Handles the pause command.
/// @param json
/// @param data array
/// @param changed
/// @param different

//called from text event
//ev|pause|1 (in seconds)
var json = argument0, data = argument1, changed = argument2, different = argument3;

if ( different ) {
	// Set waitTimer in current textbox instance and
	// switch state to waiting
	//tby_error(json[| __SCRIBBLE.TW_POSITION])
	waitTimer = room_speed*real(data[0]);
	tby_state_switch("Waiting")
}
