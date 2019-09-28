/// @desc Returns the label pointer from a label name in a label_map.
/// @param _branch
/// @param _label_name
var _branch = argument0, _label_name = argument1;

var _b/*:TbyBranch*/ = _branch;

var _label_map = _b[TbyBranch.label_map];

return _label_map[? _label_name]