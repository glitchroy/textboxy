/// @desc Destroys a given branch and all associated data structures.
/// @param _branch
var _branch = argument0;

var _b/*:TbyBranch*/ = _branch;

if (tby_branch_exists(_b) == false) exit;

// Delete message_list
var _list/*:TbyList*/ = _b[TbyBranch.message_list];
tby_list_destroy(_list);

// Delete label_map
ds_map_destroy(_b[TbyBranch.label_map]);

// Delete config_map
tby_branch_callback_execute(_b)
ds_map_destroy(_b[TbyBranch.config_map]);