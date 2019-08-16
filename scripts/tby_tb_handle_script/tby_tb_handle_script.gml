/// @desc Scribble event. Handles the script command.
/// @param _json
/// @param _data_array
/// @param _changed
/// @param _different

//called from text event
//ev|script|script_name
var _json = argument0, _data = argument1, _changed = argument2, _different = argument3;

// Handles a given script index with variable arguments
if (_different) {
    var _script_index = asset_get_index(_data[0])
    if (script_exists(_script_index)) {
        if (tby_arrlen(_data) > 1) {
            var _args = []
            array_copy(_args, 0, _data, 1, tby_arrlen(_data)-1)
            tby_spread(_script_index, _args)
        } else {
            script_execute(_script_index);
        }
    }
}
