/// @desc Returns the label pointer from a label name in a LabelMap.
/// @param _branch_name
/// @param _label_name
var _branch_name = argument0, _label_name = argument1;

var _branch = tby_branch_get(_branch_name);
var _label_map = _branch[TbyBranch.LabelMap];

return _label_map[? _label_name]