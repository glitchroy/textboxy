/// @desc Scribble event. Handles the wait command.
/// @param textElement
/// @param eventData{array}
/// @param characterIndex

// [wait]

var _text_element = argument0;
var _event_data   = argument1;
var _char_index   = argument2;

_tby_scribble_autotype_set_speed(_text_element, 0.0);
_tby_state_switch("Waiting");