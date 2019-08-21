/// @desc Executes the SetCallback config if set. Called before the branch is destroyed.
/// @param _branch_name
var _branch_name = argument0;

var _cb = tby_branch_get_config(_branch_name, TbyConfig.Callback);

if (_cb != -1 && script_exists(_cb)) {
    script_execute(_cb)
}