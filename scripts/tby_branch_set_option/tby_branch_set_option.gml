/// @desc Sets a value in the OptionsMap of a TbyBranch.
/// @param branchName
/// @param optionName
/// @param optionValue
var branchName = argument0, optionName = argument1, optionValue = argument2;

var branch = global.tby_branches[? branchName];
var optionMap = branch[TbyBranch.OptionsMap];

optionMap[? optionName] = optionValue;

// option specific actions
switch (optionName) {
    case TbyOption.SetSkin:
        global.tby_skin_tile_size = sprite_get_width(tby_array_get(optionValue, TbySkin.Frame))
    break;
}