/// @desc Scribble event. Handles the script command.
/// @param json
/// @param data(array)
/// @param character

// [script,script_name]

var _json = argument0;
var _data = argument1;
var _char = argument2;

// Handles a given script index with variable arguments
var _script_index = asset_get_index(_data[0]);
if (script_exists(_script_index)) {
    if (tby_arrlen(_data) > 1) {
        var _args = [];
        array_copy(_args, 0, _data, 1, tby_arrlen(_data)-1);
        tby_spread(_script_index, _args);
    } else {
        script_execute(_script_index);
    }
}