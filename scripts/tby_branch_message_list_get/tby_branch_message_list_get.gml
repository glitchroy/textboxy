/// @desc Returns the associated MessageList from a TbyBranch name.
/// @param _branch_name
var _branch_name = argument0;

var _branch = tby_branch_get(_branch_name);
return _branch[TbyBranch.MessageList]