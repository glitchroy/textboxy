/// @desc Gets a TbyBranch structure from a branch name.
/// @param _branch_name
var _branch_name = argument0;

if (tby_branch_exists(_branch_name)) {
    return global.tby_branches[? _branch_name];
}
tby_error("Can't find TbyBranch with the name \"" + _branch_name + "\".")
return undefined;