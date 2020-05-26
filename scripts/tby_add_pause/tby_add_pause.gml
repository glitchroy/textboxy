/// @desc Shorthand to add a TbyCmd.Pause to the active TbyBranch.
/// @param _seconds
function tby_add_pause(argument0) {
	gml_pragma("forceinline");
	return [TbyCmd.Pause, argument0];


}
