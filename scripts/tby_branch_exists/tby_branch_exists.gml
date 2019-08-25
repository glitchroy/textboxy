/// @desc Return true if the given branch exists in the global branch map.
/// @param _branch_name
gml_pragma("forceinline");
return ds_map_exists(global.tby_branches, argument0);