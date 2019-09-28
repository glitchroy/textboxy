/// @desc Sets a value in the config_map of a TbyBranch.
/// @param _branch
/// @param _config_name
/// @param _config_value
var _branch = argument0, _config_name = argument1, _config_value = argument2;

var _b/*:TbyBranch*/ = _branch;

var _config_map = _b[TbyBranch.config_map];

_config_map[? _config_name] = _config_value;