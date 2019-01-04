/// @param tby_list
var tby_list = argument0;

// return current entry and add one

var entry = tby_list_get_entry_at_pointer(tby_list)
tby_list_set_pointer(tby_list, tby_list_get_pointer(tby_list)+1)

return entry