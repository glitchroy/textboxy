/// @desc Returns the given config from the config_map of a TbyBranch.
/// @param _branch
/// @param _config_name
var _branch = argument0, _config_name = argument1;

var _b/*:TbyBranch*/ = _branch;

var _config_map = _b[TbyBranch.config_map]

return _config_map[? _config_name]