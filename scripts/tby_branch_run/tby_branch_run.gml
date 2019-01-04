/// @param name
var name = argument0;

if (global.tby_active_list_name = name && global.tby_list_kickoff == false) {
    tby_branch_next_entry();
    global.tby_list_kickoff = true;
    
    tby_hook_branch_start()
    
    exit;
}

//only run if branch is not already in progress
//if it is, the new textboxes will just get enqueued
if (global.tby_active_list_name != name) {
    global.tby_active_list_name = name
    tby_branch_next_entry()
    global.tby_list_kickoff = true;
}