/// @desc Scribble event. Handles the pause command.
/// @param json
/// @param data(array)
/// @param character

// [pause,1.0] (in seconds)

var _json = argument0;
var _data = argument1;
var _char = argument2;

pause_timer = room_speed * real(_data[0]);
tby_state_switch("Pausing")