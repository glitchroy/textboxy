tby_clear_all_branches()
if (ds_exists(global.tby_branches, ds_type_map)) {
    ds_map_destroy(global.tby_branches)
}
if (global.tby_external_strings_map != undefined && ds_exists(global.tby_external_strings_map, ds_type_map)) {
    ds_map_destroy(global.tby_external_strings_map)
}