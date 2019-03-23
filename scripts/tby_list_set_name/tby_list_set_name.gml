/// @param tby_list
/// @param name
var tby_list = argument0, name = argument1;

var meta = tby_list[| 0];
meta[TbyListMeta.BranchName] = name
ds_list_replace(tby_list, 0, meta);