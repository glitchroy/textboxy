/// @desc Executes the SetCallback config if set. Called before the branch is destroyed.
/// @param _branch
var _branch/*:TbyBranch*/ = argument0;

var _config/*:TbyConfig*/ = _branch[TbyBranch.config_array];
var _cb = _config[TbyConfig.Callback];

if (_cb != -1 && script_exists(_cb)) {
    script_execute(_cb);
}