/// @desc Returns the given option from the OptionsMap of a TbyBranch.
/// @param branchName
/// @param optionName
var branchName = argument0, optionName = argument1;

var branch = global.tby_branches[? branchName];
var optionMap = branch[TbyBranch.OptionsMap];

return optionMap[? optionName]