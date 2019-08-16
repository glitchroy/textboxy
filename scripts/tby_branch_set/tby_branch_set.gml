/// @desc Sets a TbyOption for the active TbyBranch.
/// @param option
/// @param value
var _option = argument0, _value = argument1;

// Wrapper for branch_add that already specifies TbyType.Option

tby_branch_add(TbyType.Option, _option, _value)