/// @desc Destroys a given branch and all associated data structures.
/// @param _branch_name
var _branch_name = argument0;

if (_branch_name == undefined) exit;

var _branch = tby_branch_get(_branch_name);
// Delete MessageList
tby_list_destroy(_branch[TbyBranch.MessageList]);

// Delete LabelMap
ds_map_destroy(_branch[TbyBranch.LabelMap]);

// Delete ConfigMap
tby_branch_callback_execute(_branch_name)
ds_map_destroy(_branch[TbyBranch.ConfigMap]);

// Delete the branch from the global map
ds_map_delete(global.tby_branches, _branch_name)