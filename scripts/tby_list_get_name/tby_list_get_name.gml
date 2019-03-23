/// @param tby_list
var tby_list = argument0;

if (ds_exists(tby_list, ds_type_list)) {
    var meta = tby_list[| 0];
    return meta[TbyListMeta.BranchName]
}