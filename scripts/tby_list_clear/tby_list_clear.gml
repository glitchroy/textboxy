/// @desc Clears the TbyList. Also resets the meta information.
/// @param tby_list
var tby_list = argument0;

ds_list_clear(tby_list);
tby_list[| 0] = tby_list_meta(); // tby_list information