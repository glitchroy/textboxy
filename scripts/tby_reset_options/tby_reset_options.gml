if (global.tby_current_options_map != undefined && ds_exists(global.tby_current_options_map, ds_type_map)) {
    ds_map_clear(global.tby_current_options_map)
} else {
    global.tby_current_options_map = ds_map_create()
}

global.tby_current_options_map[? TbyOption.SetInstance] = noone
global.tby_current_options_map[? TbyOption.SetCallback] = -1
global.tby_current_options_map[? TbyOption.SetPlacement] = TbyPlacement.Auto