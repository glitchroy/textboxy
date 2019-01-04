/// @param optionType
/// @param value
var optionType = argument0, value = argument1;

if (global.tby_current_options_map == undefined || !ds_exists(global.tby_current_options_map, ds_type_map)) {
    global.tby_current_options_map = ds_map_create()
}

global.tby_current_options_map[? optionType]= value;

tby_branch_next_entry()