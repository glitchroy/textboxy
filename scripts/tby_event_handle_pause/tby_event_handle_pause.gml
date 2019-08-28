/// @desc Scribble event. Handles the pause command.
/// @param _json
/// @param _data
/// @param _changed
/// @param _different

//called from text event
//[pause,1.0] (in seconds)
var _json = argument0, _data = argument1, _changed = argument2, _different = argument3;

if (_different) {
	// Set waitTimer in current textbox instance and
	// switch state to waiting
	pause_timer = room_speed * real(_data[0]);
	
    // TODO: This is a really ugly hack.
    // For some reason, speeds > 1 cause the pause to
    // occur one char too late. So we just step back.
    // Sorry.
    if (typewriter_speed > 1) {
    	var _subtract = floor(typewriter_speed) - 1;
    	_json[| __SCRIBBLE.TW_POSITION] -= _subtract
    }
	
	_json[| __SCRIBBLE.TW_SPEED] = 0
	tby_state_switch("Pausing")
}
