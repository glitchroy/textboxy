/// @desc Return true if the given branch exists in the global branch map.
/// @param branchName
var branchName = argument0;

return ds_map_exists(global.tby_branches, branchName)