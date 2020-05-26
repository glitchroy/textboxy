/// @desc Clears the TbyList. Also resets the meta information.
/// @param _tby_list
function _tby_list_clear(argument0) {
	var _tby_list/*:TbyList*/ = argument0;

	ds_list_clear(_tby_list);
	_tby_list[| 0] = _tby_list_create_meta(); // tby_list information


}
