/// @desc Resets a TbyList after the TbyBranch finishes.
/// @param _tby_list
var _tby_list = argument0;

if (ds_exists(_tby_list, ds_type_list)) {
    var _meta = _tby_list[| 0];
    ds_list_replace(_tby_list, 0, tby_list_meta());
}