/// @param tby_list
/// @param pointer_value
var tby_list = argument0, pointer_value = argument1;

if (ds_exists(tby_list, ds_type_list)) {
    var meta = tby_list[| 0];
    meta[TbyListMeta.Pointer] = pointer_value;
    ds_list_replace(tby_list, 0, meta);
}