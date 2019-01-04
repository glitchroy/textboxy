/// @param name
var name = argument0;
//#args name

//sanity check
if (global.tby_list_map == undefined) {
    global.tby_list_map = ds_map_create();
}

//if the branch already exists, clear it
//otherwise, create new branch at name
if(ds_map_exists(global.tby_list_map, name)) {
    tby_list_clear(global.tby_list_map[? name])
} else {
    global.tby_list_map[? name] = tby_list_create()
    
}

//initialize labels
if (global.tby_current_labels_map == undefined || !ds_exists(global.tby_current_labels_map, ds_type_map)) {
    global.tby_current_labels_map = ds_map_create();
} else {
    ds_map_clear(global.tby_current_labels_map)
}

return name