/// @desc Sets a value in the OptionsMap of a TbyBranch.
/// @param _branch_name
/// @param _option_name
/// @param _option_value
var _branch_name = argument0, _option_name = argument1, _option_value = argument2;

var _branch = global.tby_branches[? _branch_name];
var _option_map = _branch[TbyBranch.OptionsMap];

_option_map[? _option_name] = _option_value;

// option specific actions
switch (_option_name) {
    case TbyOption.SetSkin:
        global.tby_skin_tile_size = sprite_get_width(tby_array_get(_option_value, TbySkin.Frame))
    break;
}