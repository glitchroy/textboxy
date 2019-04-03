/// @param branchName
/// @param labelName
/// @param labelValue
var branchName = argument0, labelName = argument1, labelValue = argument2;

var branch = global.tby_branches[? branchName];
var labelMap = branch[TbyBranch.LabelMap];

labelMap[? labelName] = labelValue;