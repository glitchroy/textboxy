/// @desc Returns true if the given TbyList is empty, e.g. only as meta information.
/// @param tby_list
var tby_list = argument0;

if (tby_list_is_valid(tby_list)) {
    return (ds_list_size(tby_list) == 1)
}