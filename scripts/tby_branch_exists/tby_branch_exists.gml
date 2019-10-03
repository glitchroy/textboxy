/// @desc Return true if the given branch exists in the global branch map.
/// @param _branch
var _branch/*:TbyBranch*/ = argument0;
gml_pragma("forceinline");
return is_array(_branch);