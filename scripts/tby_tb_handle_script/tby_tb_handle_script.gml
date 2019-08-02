/// @desc Scribble event. Handles the script command.
/// @param json
/// @param data array
/// @param changed
/// @param different

//called from text event
//ev|script|script_name
var json = argument0, data = argument1, changed = argument2, different = argument3;

// Handles a given script index with variable arguments
if ( different ) {
    var script_index = asset_get_index(data[0])
    if (script_exists(script_index)) {
        if (tby_arrlen(data) > 1) {
            var args = []
            array_copy(args, 0, data, 1, tby_arrlen(data)-1)
            tby_spread(script_index, args)
        } else {
            script_execute(script_index);
        }
    }
}
