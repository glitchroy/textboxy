/// @desc Checks if the given TbyList exists. Returns a bool.
/// @param _tby_list
function _tby_list_exists(argument0) {
	gml_pragma("forceinline");
	return ds_exists(argument0, ds_type_list);


}
