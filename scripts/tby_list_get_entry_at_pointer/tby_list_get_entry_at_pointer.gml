/// @param tby_list
var tby_list = argument0;

if (ds_exists(tby_list, ds_type_list)) {
    return tby_list_get_entry_at(tby_list, tby_list_get_pointer(tby_list))
}