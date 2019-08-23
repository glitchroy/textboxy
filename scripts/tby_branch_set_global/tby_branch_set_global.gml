/// @desc Shorthand to add a TbyCmd.SetGlobal to the active TbyBranch.
/// @param _identifier
/// @param _value
var _identifier = argument0, _value = argument1;

return [TbyCmd.SetGlobal, _identifier, _value]