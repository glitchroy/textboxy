/// @desc Sets a TbyConfig for the active TbyBranch.
/// @param _config
/// @param _value
var _config = argument0, _value = argument1;

// Wrapper for branch_add that already specifies TbyType.Config

tby_branch_add(TbyType.Config, _config, _value)