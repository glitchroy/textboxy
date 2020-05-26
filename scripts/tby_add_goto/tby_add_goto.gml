/// @desc Shorthand to add a TbyCmd.GoTo to the active TbyBranch.
/// @param _label_name
function tby_add_goto(argument0) {
	gml_pragma("forceinline");
	return [TbyCmd.GoTo, argument0];


}
