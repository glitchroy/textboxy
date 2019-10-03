/// @desc Shorthand to add a TbyCmd.SetVar to the active TbyBranch.
/// @param _identifier
/// @param _value
/// @param _instance = id
var _identifier = argument[0], _value = argument[1];
var _instance = argument_count > 2 ? argument[2] : id;

return [TbyCmd.SetVar, _instance, _identifier, _value];