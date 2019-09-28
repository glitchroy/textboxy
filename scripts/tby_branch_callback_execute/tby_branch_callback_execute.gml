/// @desc Executes the SetCallback config if set. Called before the branch is destroyed.
/// @param _branch
var _branch = argument0;

var _b/*:TbyBranch*/ = _branch;

var _cb = tby_branch_config_get(_b, TbyConfig.Callback);

if (_cb != -1 && script_exists(_cb)) {
    script_execute(_cb)
}