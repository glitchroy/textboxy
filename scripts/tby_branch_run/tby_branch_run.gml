/// @desc Executes the specified TbyBranch.
/// @param _branch
/// @param _destroy_on_finish = false
var _branch = argument[0];
var _destroy_on_finish = argument_count > 1 ? argument[1] : false;

var _b/*:TbyBranch*/ = _branch;
var _list/*:TbyList*/ = _b[TbyBranch.message_list];

var _current_list_advanced = tby_list_get_has_been_advanced(_list);

if (_current_list_advanced) {
    tby_log("Trying to run TbyBranch while it is already running.")
    exit;
}

_b[@TbyBranch.destroy_on_finish] = _destroy_on_finish;

tby_branch_label_scan(_b);

tby_branch_next(_b);

tby_hook_branch_start()