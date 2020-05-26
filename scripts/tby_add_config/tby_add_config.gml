/// @desc Sets a TbyConfig for the active TbyBranch.
/// @param _config
/// @param _value
function tby_add_config(argument0, argument1) {
	gml_pragma("forceinline");
	return [TbyCmd.Config, argument0, argument1];


}
