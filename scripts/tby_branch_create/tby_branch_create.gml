/// @param ?name = undefined
var name = argument_count > 0 ? argument[0] : undefined;

// We check if our map holding all lists exists (sanity check)
if (global.tby_list_map == undefined) {
    global.tby_list_map = ds_map_create();
}

var newList = tby_list_create();
// If no name is given, we create the list and assign the name based
// on the list index (integer)
if (name == undefined) {
    name = "tby-branch-" + string(newList);
    tby_log("TbyBranch creation, no name given. Using default name \"" + name + "\".")
} else {
    tby_log("Create TbyBranch with name \"" + name + "\".")
}

// Then, we check if our name is a list already
// If so, we abort
if(ds_map_exists(global.tby_list_map, name)) {
    tby_log("Can't create TbyBranch \""+ name +"\" because it already exists.")
    tby_list_destroy(newList);
    return undefined;
}

// We set the name in the TbyList meta add the list to our global map
tby_list_set_name(newList, name);
global.tby_list_map[? name] = newList;



// We initialize the labels for the current list
if (global.tby_current_labels_map == undefined || !ds_exists(global.tby_current_labels_map, ds_type_map)) {
    global.tby_current_labels_map = ds_map_create();
} else {
    ds_map_clear(global.tby_current_labels_map)
}

// Automatically use the list
global.tby_active_list = newList


return newList