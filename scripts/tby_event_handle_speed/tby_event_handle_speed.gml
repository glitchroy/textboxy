/// @desc Scribble event. Handles the speed command.
/// @param textElement
/// @param eventData{array}
/// @param characterIndex

// [speed,1] (bigger -> slower)

var _text_element = argument0;
var _event_data   = argument1;
var _char_index   = argument2;

tw_speed = real(_event_data[0]);
scribble_autotype_set(_text_element, SCRIBBLE_TYPEWRITER_PER_CHARACTER, real(_event_data[0]), 0, true);