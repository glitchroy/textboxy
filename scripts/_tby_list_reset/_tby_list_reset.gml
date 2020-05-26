/// @desc Resets a TbyList after the TbyBranch finishes.
/// @param _tby_list
function _tby_list_reset(argument0) {
	var _tby_list/*:TbyList*/ = argument0;

	if (_tby_list_exists(_tby_list)) {
	    ds_list_replace(_tby_list, 0, _tby_list_create_meta());
	}


}
