/// @desc Destroys a given branch and all associated data structures.
/// @param branchName
var branchName = argument0;

if (branchName == undefined) exit;

var branchPayload = global.tby_branches[? branchName];
// Delete MessageList
tby_list_destroy(branchPayload[TbyBranch.MessageList]);

// Delete LabelMap
ds_map_destroy(branchPayload[TbyBranch.LabelMap]);

// Delete OptionsMap
tby_branch_execute_callback(branchName)
ds_map_destroy(branchPayload[TbyBranch.OptionsMap]);

// Delete the branch from the global map
ds_map_delete(global.tby_branches, branchName)