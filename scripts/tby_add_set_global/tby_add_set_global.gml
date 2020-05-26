/// @desc Shorthand to add a TbyCmd.SetGlobal to the active TbyBranch.
/// @param _identifier
/// @param _value
function tby_add_set_global(argument0, argument1) {
	gml_pragma("forceinline");
	return [TbyCmd.SetGlobal, argument0, argument1];


}
