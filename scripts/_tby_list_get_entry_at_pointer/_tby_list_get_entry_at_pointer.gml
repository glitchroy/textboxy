/// @desc Returns the list entry at the pointers position.
/// @param _tby_list
function _tby_list_get_entry_at_pointer(argument0) {
	var _tby_list/*:TbyList*/ = argument0;

	if (_tby_list_exists(_tby_list)) {
	    return _tby_list_get_entry_at(_tby_list, _tby_list_get_pointer(_tby_list));
	}


}
