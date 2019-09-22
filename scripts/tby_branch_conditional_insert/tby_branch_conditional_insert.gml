/// @param _branch_name
/// @param _starting_pos
/// @param _condition_array
var _branch_name = argument0, _starting_pos = argument1, _condition_array = argument2;

var _pos = _starting_pos

for (var i = 0; i < tby_arrlen(_condition_array); i++) {
    tby_branch_insert(_branch_name, _pos, _condition_array[i])
    _pos++;
}