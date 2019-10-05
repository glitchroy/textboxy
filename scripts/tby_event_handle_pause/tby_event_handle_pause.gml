/// @desc Scribble event. Handles the pause command.
/// @param json
/// @param data(array)
/// @param character

// [pause,1.0] (in seconds)

var _json = argument0;
var _data = argument1;
var _char = argument2;

var _seconds;
if (is_undefined(_data) == false || is_array(_data) == false || is_real(_data[0]) == false) {
    _seconds = 1;
} else {
    _seconds = _data[0];
}
pause_timer = room_speed * real(_seconds);
scribble_typewriter_set_speed(_json, 0);