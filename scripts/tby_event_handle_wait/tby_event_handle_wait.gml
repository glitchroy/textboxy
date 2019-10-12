/// @desc Scribble event. Handles the wait command.
/// @param textElement
/// @param eventData{array}
/// @param characterIndex

// [wait]

var _text_element = argument0;
var _event_data   = argument1;
var _char_index   = argument2;

tby_scribble_autotype_set_speed(_text_element, 0.0);
tby_state_switch("Waiting");