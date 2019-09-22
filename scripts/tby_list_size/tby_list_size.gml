/// @desc Returns the size of the TbyList, excluding the meta entry.
/// @param _tby_list
var _tby_list = argument0;

if (tby_list_is_valid(_tby_list)) {
    return ds_list_size(_tby_list) - 1
}