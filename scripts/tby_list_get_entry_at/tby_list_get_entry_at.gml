/// @param tby_list
/// @param pos
var tby_list = argument0, pos = argument1;

if (ds_exists(tby_list, ds_type_list)) {
    return tby_list[| pos+1]
}