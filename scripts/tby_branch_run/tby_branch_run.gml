/// @desc Executes the specified TbyBranch.
/// @param _branch
/// @param _destroy_on_finish = false
var _branch/*:TbyBranch*/ = argument[0];
var _destroy_on_finish = argument_count > 1 ? argument[1] : false;

var _list/*:TbyList*/ = _branch[TbyBranch.message_list];
var _meta/*:TbyListMeta*/ = _tby_list_meta(_list);

if (_meta[TbyListMeta.HasBeenAdvanced]) {
    tby_log("Trying to run TbyBranch while it is already running.");
    exit;
}

_branch[@TbyBranch.destroy_on_finish] = _destroy_on_finish;

_tby_branch_label_scan(_branch);

with (tby_object_manager) {
    branch = _branch;
}

_tby_branch_next(_branch);

tby_hook_branch_start();