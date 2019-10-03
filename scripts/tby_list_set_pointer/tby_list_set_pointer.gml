/// @desc Sets the pointer of the TbyList to the given value.
/// @param _tby_list
/// @param _pointer_value
var _tby_list/*:TbyList*/ = argument0, _pointer_value = argument1;

if (tby_list_exists(_tby_list)) {
    var _meta/*:TbyListMeta*/ = tby_list_meta(_tby_list);
    _meta[@TbyListMeta.Pointer] = _pointer_value;
    ds_list_replace(_tby_list, 0, _meta);
}

