/// @param name
var name = argument0;

var currentListAdvanced = tby_list_get_has_been_advanced(tby_branch_get_active_id());
if (global.tby_active_list_name == name && !currentListAdvanced) {
    tby_branch_next_entry();
    
    tby_hook_branch_start()
    
    exit;
}

if (currentListAdvanced) {
    tby_log("Trying to run TbyBranch \""+ name +"\" while it is already running.")
}

//only run if branch is not already in progress
//if it is, the new textboxes will just get enqueued
if (global.tby_active_list_name != name) {
    global.tby_active_list_name = name
    tby_branch_next_entry()
}