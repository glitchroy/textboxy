/// @desc Destroys a given branch and all associated data structures.
/// @param _branch_name
var _branch_name = argument0;

if (_branch_name == undefined) exit;

var _branch_payload = global.tby_branches[? _branch_name];
// Delete MessageList
tby_list_destroy(_branch_payload[TbyBranch.MessageList]);

// Delete LabelMap
ds_map_destroy(_branch_payload[TbyBranch.LabelMap]);

// Delete ConfigMap
tby_branch_execute_callback(_branch_name)
ds_map_destroy(_branch_payload[TbyBranch.ConfigMap]);

// Delete the branch from the global map
ds_map_delete(global.tby_branches, _branch_name)