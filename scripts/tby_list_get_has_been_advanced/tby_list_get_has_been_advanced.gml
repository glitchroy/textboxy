/// @desc Returns true if the HasBeenAdvanced meta flag is set.
/// @param _tby_list
var _tby_list = argument0;

if (tby_list_exists(_tby_list)) {
    var _meta = _tby_list[| 0];
    return _meta[TbyListMeta.HasBeenAdvanced]
}