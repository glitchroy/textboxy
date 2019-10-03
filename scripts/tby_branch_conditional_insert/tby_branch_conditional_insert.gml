/// @param _branch
/// @param _starting_pos
/// @param _condition_array
var _branch = argument0, _starting_pos = argument1, _condition_array = argument2;

var _b/*:TbyBranch*/ = _branch;
var _list/*:TbyList*/ = _b[TbyBranch.message_list];

var _pos = _starting_pos;

for (var i = 0; i < tby_arrlen(_condition_array); i++) {
    tby_list_insert(_list, _pos, _condition_array[i]);
    _pos++;
}