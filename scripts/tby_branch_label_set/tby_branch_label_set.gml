/// @desc Sets a label in a TbyBranch's LabelMap.
/// @param _branch_name
/// @param _label_name
/// @param _label_value
var _branch_name = argument0, _label_name = argument1, _label_value = argument2;

var _branch = tby_branch_get(_branch_name);
var _label_map = _branch[TbyBranch.LabelMap];

_label_map[? _label_name] = _label_value;