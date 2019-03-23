/// @param branchName
var branchName = argument0;

var cb = tby_branch_get_option(branchName, TbyOption.SetCallback);

if (cb != -1 && script_exists(cb)) {
    script_execute(cb)
}