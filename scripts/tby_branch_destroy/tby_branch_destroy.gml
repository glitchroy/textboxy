/// @param tby_list
var tby_list = argument0;

if (tby_list != undefined && tby_list_exists(tby_list)) {
    
    var name = tby_list_get_name(tby_list);
    
    tby_list_destroy(tby_list)
    ds_map_delete(global.tby_list_map, name)
    
    if (ds_exists(global.tby_current_labels_map, ds_type_map)) {
        ds_map_clear(global.tby_current_labels_map)
    }
    
    if (global.tby_active_list == tby_list) {
        
        global.tby_active_list = undefined;
        
        // Execute callback if specified
        if (ds_exists(global.tby_current_options_map, ds_type_map)) {
            var cb = tby_get_option(TbyOption.SetCallback);
            if (cb != -1 && script_exists(cb)) {
                script_execute(cb)
            }
        }
        
        tby_reset_options()
    }
}