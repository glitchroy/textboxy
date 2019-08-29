/// @desc Scribble event. Handles the wait command.
/// @param json
/// @param data(array)
/// @param character

// [wait]

var _json = argument0;
var _data = argument1;
var _char = argument2;

scribble_typewriter_set_speed(_json, 0)
tby_state_switch("WaitingForInput")
