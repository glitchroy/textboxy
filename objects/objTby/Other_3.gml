tby_branch_clear_map()
if (ds_exists(global.tby_list_map, ds_type_map)) {
    ds_map_destroy(global.tby_list_map)
}
if (global.tby_current_labels_map != undefined && ds_exists(global.tby_current_labels_map, ds_type_map)) {
    ds_map_destroy(global.tby_current_labels_map)
}
if (ds_exists(global.tby_current_options_map, ds_type_map)) {
    ds_map_destroy(global.tby_current_options_map)
}
if (global.tby_external_strings_map != undefined && ds_exists(global.tby_external_strings_map, ds_type_map)) {
    ds_map_destroy(global.tby_external_strings_map)
}