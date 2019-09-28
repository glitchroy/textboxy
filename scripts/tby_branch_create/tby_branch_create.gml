/// @desc Creates a new TbyBranch. Returns the named identifier or a randomly generated one.
/// @param _command_list
var _command_list = argument0;

// Register new branch to global map

tby_log("Creating TbyBranch...")

var _b/*:TbyBranch*/ = array_create(TbyBranch.sizeof);
_b[@TbyBranch.message_list] = tby_list_create();
tby_branch_nested_array_add(_b, _command_list);

_b[@TbyBranch.label_map] = ds_map_create();
_b[@TbyBranch.config_map] = ds_map_create();
_b[@TbyBranch.destroy_on_finish] = false;

tby_branch_config_set_defaults(_b);

return _b;