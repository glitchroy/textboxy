/// @desc Returns true if the HasBeenAdvanced meta flag is set.
/// @param tby_list
var tby_list = argument0;

if (tby_list_exists(tby_list)) {
    var meta = tby_list[| 0];
    return meta[TbyListMeta.HasBeenAdvanced]
}