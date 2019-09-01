/// @desc Returns the given config from the ConfigMap of a TbyBranch.
/// @param _branch_name
/// @param _config_name
var _branch_name = argument0, _config_name = argument1;

var _branch = tby_branch_get(_branch_name);
var _config_map = _branch[TbyBranch.ConfigMap];

return _config_map[? _config_name]