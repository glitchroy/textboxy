/// @desc Returns the associated MessageList from a TbyBranch name.
/// @param branchName
var branchName = argument0;

var branch = global.tby_branches[? branchName];
return branch[TbyBranch.MessageList]