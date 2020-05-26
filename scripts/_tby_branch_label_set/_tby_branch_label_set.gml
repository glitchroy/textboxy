/// @desc Sets a label in a TbyBranch's label_map.
/// @param _branch
/// @param _label_name
/// @param _label_value
function _tby_branch_label_set(argument0, argument1, argument2) {
	var _branch = argument0, _label_name = argument1, _label_value = argument2;

	var _b/*:TbyBranch*/ = _branch;

	var _label_map = _b[TbyBranch.label_map];

	_label_map[? _label_name] = _label_value;


}
