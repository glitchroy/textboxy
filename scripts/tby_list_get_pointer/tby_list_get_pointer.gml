/// @desc Return the current TbyList pointer.
/// @param _tby_list
var _tby_list = argument0;

if (ds_exists(_tby_list, ds_type_list)) {
    var _meta = _tby_list[| 0];
    return _meta[TbyListMeta.Pointer]
}