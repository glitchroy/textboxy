/// @param name
var name = argument0;


var q = tby_branch_get_id(name)
if (q != undefined && tby_list_exists(q)) {
    
    tby_list_destroy(q)
    ds_map_delete(global.tby_list_map, name)
    
    if (ds_exists(global.tby_current_labels_map, ds_type_map)) {
        ds_map_clear(global.tby_current_labels_map)
    }
    
    if (global.tby_active_list_name == name) {
        
        //add code to finished branch
        tby_list_add(global.tby_finished_lists_list, name);
        
        global.tby_active_list_name = undefined;
        
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