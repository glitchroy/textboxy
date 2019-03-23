/// @param ?branchName = undefined
var branchName = argument_count > 0 ? argument[0] : undefined;

// If no branch name is given, assume the global active one
if (branchName == undefined) {
    branchName = global.tby_active_branch;
}

// Abort if the branch does not exist
if (tby_branch_exists(branchName) == false) {
    tby_log("Can't find TbyBranch \"" + branchName + "\".");
    exit;
}

// Abort if the branch is already running
var branchList = tby_branch_get_message_list(branchName);
var currentListAdvanced = tby_list_get_has_been_advanced(branchList);

if (currentListAdvanced) {
    tby_log("Trying to run TbyBranch \"" + string(branchName) + "\" while it is already running.")
    exit;
}

// Automatically use the given list if it is not the active one
if (global.tby_active_branch != branchName) {
    tby_branch_use(branchName);
}

tby_branch_scan_labels();
tby_branch_next_entry(branchName);
tby_hook_branch_start()