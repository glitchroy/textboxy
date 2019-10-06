/// @desc Scribble event. Handles the script command.
/// @param textElement
/// @param eventData{array}
/// @param characterIndex

// [script,script_name]

var _text_element = argument0;
var _event_data   = argument1;
var _char_index   = argument2;

// Handles a given script index with variable arguments
var _script_index = asset_get_index(_event_data[0]);
if (script_exists(_script_index)) {
    if (tby_arrlen(_event_data) > 1) {
        var _args = [];
        array_copy(_args, 0, _event_data, 1, tby_arrlen(_event_data)-1);
        tby_spread(_script_index, _args);
    } else {
        script_execute(_script_index);
    }
}