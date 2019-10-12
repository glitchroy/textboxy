/// @desc Scribble event. Handles the pause command.
/// @param textElement
/// @param eventData{array}
/// @param characterIndex

// [pause,1.0] (in seconds)

var _text_element = argument0;
var _event_data   = argument1;
var _char_index   = argument2;

var _seconds = 1;
if (is_array(_event_data)) _seconds = _event_data[0];

pause_timer = room_speed * real(_seconds);
tby_scribble_autotype_set_speed(_text_element, 0.0);