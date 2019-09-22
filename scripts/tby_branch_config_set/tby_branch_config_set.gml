/// @desc Sets a value in the ConfigMap of a TbyBranch.
/// @param _branch_name
/// @param _config_name
/// @param _config_value
var _branch_name = argument0, _config_name = argument1, _config_value = argument2;

var _branch = tby_branch_get(_branch_name);
var _config_map = _branch[TbyBranch.ConfigMap];

_config_map[? _config_name] = _config_value;

// config specific actions
switch (_config_name) {
    case TbyConfig.Skin:
        global.tby_skin_tile_size = sprite_get_width(tby_array_get(_config_value, TbySkin.Frame)) / 3
    break;
}