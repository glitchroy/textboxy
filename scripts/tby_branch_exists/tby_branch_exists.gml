/// @desc Return true if the given branch exists in the global branch map.
/// @param _branch_name
var _branch_name = argument0;

return ds_map_exists(global.tby_branches, _branch_name)