/// @desc Adds an entry to the MessageList of a TbyBranch.
/// @param branchName
/// @param entry
var branchName = argument0, entry = argument1;

var branch = global.tby_branches[? branchName];
var list = branch[TbyBranch.MessageList]

tby_list_add(list, entry)