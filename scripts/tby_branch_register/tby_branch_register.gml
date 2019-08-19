/// @desc Registers a branch to the global branch map.
/// @param _branch_name
var _branch_name = argument0;

// Register new branch to global map

tby_log("Creating TbyBranch \"" + _branch_name + "\".")

var _branch_payload = [];
_branch_payload[TbyBranch.MessageList] = tby_list_create();
_branch_payload[TbyBranch.LabelMap] = ds_map_create();
_branch_payload[TbyBranch.ConfigMap] = ds_map_create();

global.tby_branches[? _branch_name] = _branch_payload;

tby_branch_set_default_configs(_branch_name);