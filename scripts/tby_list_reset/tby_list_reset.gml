/// @desc Resets a TbyList after the TbyBranch finishes.
/// @param _tby_list
var _tby_list/*:TbyList*/ = argument0;

if (tby_list_exists(_tby_list)) {
    ds_list_replace(_tby_list, 0, tby_list_create_meta());
}