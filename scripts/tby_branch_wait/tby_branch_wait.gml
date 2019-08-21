/// @desc Shorthand to add a TbyType.Wait to the active TbyBranch.
/// @param _seconds
var _seconds = argument0;

// Wrapper for branch_add that already specifies TbyType.Wait

return [TbyType.Wait, _seconds]