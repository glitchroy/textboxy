/// @desc Shorthand to add a TbyType.Box to the active TbyBranch.
/// @param _text
/// @param ?_placement = undefined
function tby_add_box() {
	var _text = argument[0];
	var _placement = argument_count > 1 ? argument[1] : undefined;

	return [TbyType.Box, _text, _placement];


}
