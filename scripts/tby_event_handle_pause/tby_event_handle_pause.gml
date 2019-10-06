/// @desc Scribble event. Handles the pause command.
/// @param textElement
/// @param eventData{array}
/// @param characterIndex

// [pause,1.0] (in seconds)

var _text_element = argument0;
var _event_data   = argument1;
var _char_index   = argument2;

var _seconds;
if (is_undefined(_event_data) == false || is_array(_event_data) == false || is_real(_event_data[0]) == false) {
    _seconds = 1;
} else {
    _seconds = _event_data[0];
}
pause_timer = room_speed * real(_seconds);
scribble_autotype_set(_text_element, SCRIBBLE_TYPEWRITER_PER_CHARACTER, 0, 0, true);