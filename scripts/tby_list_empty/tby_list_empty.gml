/// @desc Returns true if the given TbyList is empty, e.g. only as meta information.
/// @param _tby_list
var _tby_list = argument0;

if (tby_list_is_valid(_tby_list)) {
    return (ds_list_size(_tby_list) == 1)
}