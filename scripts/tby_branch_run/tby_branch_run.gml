/// @desc Executes the specified TbyBranch. If no identifier is provided, it uses the active TbyBranch.
/// @param ?_branch_name = undefined
var _branch_name = argument_count > 0 ? argument[0] : undefined;

// If no branch name is given, assume the global active one
if (_branch_name == undefined) {
    _branch_name = global.tby_active_branch;
}

// Abort if the branch does not exist
if (tby_branch_exists(_branch_name) == false) {
    tby_log("Can't find TbyBranch \"" + _branch_name + "\".");
    exit;
}

// Abort if the branch is already running
var _branch_list = tby_branch_get_message_list(_branch_name);
var _current_list_advanced = tby_list_get_has_been_advanced(_branch_list);

if (_current_list_advanced) {
    tby_log("Trying to run TbyBranch \"" + string(_branch_name) + "\" while it is already running.")
    exit;
}

// Automatically use the given list if it is not the active one
if (global.tby_active_branch != _branch_name) {
    tby_branch_use(_branch_name);
}

tby_branch_scan_labels();
tby_branch_next_entry(_branch_name);
tby_hook_branch_start()