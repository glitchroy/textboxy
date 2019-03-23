/// @param branchName
/// @param optionName
var branchName = argument0, optionName = argument1;

var branch = global.tby_branches[? branchName];
var optionMap = branch[TbyBranch.OptionsMap];

return optionMap[? optionName]