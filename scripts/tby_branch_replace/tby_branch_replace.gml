/// @desc Inserts a value after the pointer location in the MessageList.
/// @param _branch_name
/// @param _pos
/// @param _entry
var _branch_name = argument0, _pos = argument1, _entry = argument2;

var _branch = tby_branch_get(_branch_name);
var _list = _branch[TbyBranch.MessageList]

tby_list_replace(_list, _pos, _entry)