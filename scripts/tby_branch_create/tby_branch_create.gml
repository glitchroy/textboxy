/// @desc Creates a new TbyBranch. Returns the named identifier or a randomly generated one.
/// @param _command_list
var _command_list = argument0;

// Register new branch to global map

tby_log("Creating TbyBranch...");

var _branch/*:TbyBranch*/ = array_create(TbyBranch.sizeof);
_branch[@TbyBranch.message_list] = tby_list_create();
tby_branch_nested_array_add(_branch, _command_list);

_branch[@TbyBranch.label_map] = ds_map_create();
_branch[@TbyBranch.config_array] = array_create(TbyConfig.sizeof);
_branch[@TbyBranch.destroy_on_finish] = false;

_branch[@TbyBranch.scribble_cache_group] = "tby-branch"; 

tby_branch_config_set_defaults(_branch);

return _branch;