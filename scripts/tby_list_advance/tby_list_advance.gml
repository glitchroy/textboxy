/// @param tby_list
var tby_list = argument0;

// return current entry and add one
var entry = tby_list_get_entry_at_pointer(tby_list)
tby_list_set_pointer(tby_list, tby_list_get_pointer(tby_list)+1)

// Set has been advanced in meta
var meta = tby_list[| 0];
meta[TbyListMeta.HasBeenAdvanced] = true
ds_list_replace(tby_list, 0, meta);

return entry