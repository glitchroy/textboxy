if (ds_exists(global.tby_conditions, ds_type_map)) {
    ds_map_destroy(global.tby_conditions)
}
if (global.tby_external_strings_map != undefined && ds_exists(global.tby_external_strings_map, ds_type_map)) {
    ds_map_destroy(global.tby_external_strings_map)
}