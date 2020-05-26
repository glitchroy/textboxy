/// @desc Destroys the given TbyList.
/// @param _tby_list
function _tby_list_destroy(argument0) {
	var _tby_list/*:TbyList*/ = argument0;

	if (ds_exists(_tby_list, ds_type_list)) {
	    ds_list_destroy(_tby_list);
	}


}
