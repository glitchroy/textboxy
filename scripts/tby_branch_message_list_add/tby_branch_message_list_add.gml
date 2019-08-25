/// @desc Adds an entry to the MessageList of a TbyBranch.
/// @param _branch_name
/// @param _entry
var _branch_name = argument0, _entry = argument1;

var _branch = global.tby_branches[? _branch_name];
var _list = _branch[TbyBranch.MessageList]

tby_list_add(_list, _entry)