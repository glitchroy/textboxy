/// @param _tby_list
function _tby_list_meta(argument0) {
	var _tby_list/*:TbyList*/ = argument0;

	if (_tby_list_exists(_tby_list)) {
	    return _tby_list[| 0];
	}
	return undefined;


}
