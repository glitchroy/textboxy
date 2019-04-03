/// @param branchName
/// @param labelName
var branchName = argument0, labelName = argument1;

var branch = global.tby_branches[? branchName];
var labelMap = branch[TbyBranch.LabelMap];

return labelMap[? labelName]