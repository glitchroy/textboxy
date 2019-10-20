/// @desc Adds a value to the end of the TbyList.
/// @param _tby_list
/// @param _val
var _tby_list/*:TbyList*/ = argument0, _val = argument1;

if (_tby_list_exists(_tby_list)) {
    ds_list_add(_tby_list, _val);
}