/// @desc Returns the list entry at the pointers position.
/// @param _tby_list
var _tby_list = argument0;

if (ds_exists(_tby_list, ds_type_list)) {
    return tby_list_get_entry_at(_tby_list, tby_list_get_pointer(_tby_list))
}