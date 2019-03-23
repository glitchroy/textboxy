/// @param ?tby_list_or_name = undefined
var tby_list_or_name = argument_count > 0 ? argument[0] : undefined;

// Assuming argument is the list id
var tby_list = tby_list_or_name;

if (tby_list_or_name == undefined) {
    // If argument is not given, use the active list
    tby_list = global.tby_active_list;
} else if (is_string(tby_list_or_name)) {
    // If the argument is string, try to use it as identifier
    tby_list = tby_branch_get_id(tby_list_or_name);
}

// Abort if list does not exist
if (tby_list_exists(tby_list) == false) {
    tby_log("Can't find TbyBranch " + string(tby_list) + " / " + string(tby_list_or_name) + ".");
    exit;
}

var currentListAdvanced = tby_list_get_has_been_advanced(tby_list);

if (currentListAdvanced) {
    tby_log("Trying to run TbyBranch \""+ name +"\" while it is already running.")
    exit;
}

// Automatically use the given list if it is not the active one
if (global.tby_active_list != tby_list) {
    tby_branch_use(tby_list);
}

tby_branch_scan_labels();
tby_branch_next_entry();
tby_hook_branch_start()