/// @desc Destroys a given branch and all associated data structures.
/// @param _branch
var _branch/*:TbyBranch*/ = argument0;

if (tby_branch_exists(_branch) == false) exit;

// Delete message_list
var _list/*:TbyList*/ = _branch[TbyBranch.message_list];
tby_list_destroy(_list);

// Delete label_map
ds_map_destroy(_branch[TbyBranch.label_map]);

// Delete config_arrax
tby_branch_callback_execute(_branch);
_branch[@TbyBranch.config_array] = 0;

with (tby_object_manager) {
    branch = undefined;
}