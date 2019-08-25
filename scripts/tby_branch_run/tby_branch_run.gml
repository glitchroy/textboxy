/// @desc Executes the specified TbyBranch.
/// @param _branch_name
var _branch_name = argument0;

// Abort if the branch does not exist
if (_branch_name == undefined || tby_branch_exists(_branch_name) == false) {
    tby_log("Can't find TbyBranch \"" + _branch_name + "\".");
    exit;
}

// Abort if the branch is already running
var _branch_list = tby_branch_message_list_get(_branch_name);
var _current_list_advanced = tby_list_get_has_been_advanced(_branch_list);

if (_current_list_advanced) {
    tby_log("Trying to run TbyBranch \"" + string(_branch_name) + "\" while it is already running.")
    exit;
}

tby_branch_label_scan(_branch_name);

tby_branch_next(_branch_name);

tby_hook_branch_start()