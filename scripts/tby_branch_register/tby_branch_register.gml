/// @desc Registers a branch to the global branch map.
/// @param branchName
var branchName = argument0;

// Register new branch to global map

tby_log("Creating TbyBranch \"" + branchName + "\".")

var branchPayload = [];
branchPayload[TbyBranch.MessageList] = tby_list_create();
branchPayload[TbyBranch.LabelMap] = ds_map_create();
branchPayload[TbyBranch.OptionsMap] = ds_map_create();

global.tby_branches[? branchName] = branchPayload;

tby_branch_set_default_options(branchName);