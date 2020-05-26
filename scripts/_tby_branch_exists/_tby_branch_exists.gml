/// @desc Return true if the given branch exists.
/// @param _branch
function _tby_branch_exists(argument0) {
	var _branch/*:TbyBranch*/ = argument0;
	gml_pragma("forceinline");
	return is_array(_branch);


}
