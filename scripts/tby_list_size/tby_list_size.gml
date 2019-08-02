/// @desc Returns the size of the TbyList, excluding the meta entry.
/// @param tby_list
var tby_list = argument0;

if (tby_list_is_valid(tby_list)) {
    return ds_list_size(tby_list) - 1
}