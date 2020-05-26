/// @desc Return the current TbyList pointer.
/// @param _tby_list
function _tby_list_get_pointer(argument0) {
	var _tby_list/*:TbyList*/ = argument0;

	var _meta/*:TbyListMeta*/ = _tby_list_meta(_tby_list);
	return _meta[TbyListMeta.Pointer];


}
