/// @desc Scribble event. Handles the pause command.
/// @param _json
/// @param _data_array
/// @param _changed
/// @param _different

//called from text event
//[pause,1.0] (in seconds)
var _json = argument0, _data = argument1, _changed = argument2, _different = argument3;

if (_different) {
	// Set waitTimer in current textbox instance and
	// switch state to waiting
	wait_timer = room_speed * real(_data[0]);
	tby_state_switch("Waiting")
}
