/// @desc Adds a value to the end of the TbyList.
/// @param _tby_list
/// @param _val
var _tby_list = argument0, _val = argument1;

if (ds_exists(_tby_list, ds_type_list)) {
    ds_list_add(_tby_list, _val)
}