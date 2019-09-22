/// @desc Shorthand to add a TbyType.Bubble to the active TbyBranch.
/// @param _text
/// @param ?_instance = undefined
var _text = argument[0];
var _instance = argument_count > 1 ? argument[1] : undefined;

return [TbyType.Bubble, _text, _instance]