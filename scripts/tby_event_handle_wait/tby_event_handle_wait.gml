/// @desc Scribble event. Handles the wait command.
/// @param _json
/// @param _data
/// @param _changed
/// @param _different

//called from text event
//[pause]
var _json = argument0, _data = argument1, _changed = argument2, _different = argument3;

if (_different) {
	tby_state_switch("WaitingForInput")
}
