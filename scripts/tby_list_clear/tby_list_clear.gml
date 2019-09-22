/// @desc Clears the TbyList. Also resets the meta information.
/// @param _tby_list
var _tby_list = argument0;

ds_list_clear(_tby_list);
_tby_list[| 0] = tby_list_meta(); // tby_list information