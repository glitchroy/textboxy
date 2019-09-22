/// @desc Scribble event. Handles the speed command.
/// @param json
/// @param data(array)
/// @param character

// [speed,1] (bigger -> slower)

var _json = argument0;
var _data = argument1;
var _char = argument2;

typewriter_speed = real(_data[0]);
scribble_typewriter_set_speed(_json, real(_data[0])); 