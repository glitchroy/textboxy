/// @desc Destroys the given TbyList.
/// @param _tby_list
var _tby_list = argument0;

if (ds_exists(_tby_list, ds_type_list)) {
    ds_list_destroy(_tby_list)
}