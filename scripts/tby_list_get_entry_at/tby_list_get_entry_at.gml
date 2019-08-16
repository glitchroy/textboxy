/// @desc Returns the list entry at the provided position.
/// @param _tby_list
/// @param _pos
var _tby_list = argument0, _pos = argument1;

if (ds_exists(_tby_list, ds_type_list)) {
    return _tby_list[| _pos+1]
}