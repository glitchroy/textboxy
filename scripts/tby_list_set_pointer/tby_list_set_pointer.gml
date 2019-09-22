/// @desc Sets the pointer of the TbyList to the given value.
/// @param _tby_list
/// @param _pointer_value
var _tby_list = argument0, _pointer_value = argument1;

if (ds_exists(_tby_list, ds_type_list)) {
    var _meta = _tby_list[| 0];
    _meta[TbyListMeta.Pointer] = _pointer_value;
    ds_list_replace(_tby_list, 0, _meta);
}