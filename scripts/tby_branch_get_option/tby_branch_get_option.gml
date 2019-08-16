/// @desc Returns the given option from the OptionsMap of a TbyBranch.
/// @param _branch_name
/// @param _option_name
var _branch_name = argument0, _option_name = argument1;

var _branch = global.tby_branches[? _branch_name];
var _option_map = _branch[TbyBranch.OptionsMap];

return _option_map[? _option_name]