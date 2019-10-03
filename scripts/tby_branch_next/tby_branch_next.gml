/// @desc Calls the next entry on the TbyBranch or destroys it if finished.
/// @param _branch
var _branch/*:TbyBranch*/ = argument0;

#region Exit Conditions
if (tby_branch_exists(_branch) == false) exit;

var _list/*:TbyList*/ = _branch[TbyBranch.message_list];

if (tby_list_finished(_list)) {
    //current branch is finished
    if (_branch[TbyBranch.destroy_on_finish]) {
        tby_branch_destroy(_branch);
    } else {
        // Reset branch
        tby_list_reset(_list);
    }

    tby_hook_branch_finished();
    exit;
}
#endregion

//release and create new textbox
var _tb_data = tby_list_advance(_list);

if (_tb_data == undefined) {
    tby_log("Found undefined entry in TbyList. Destroying TbyBranch.");
    tby_branch_destroy(_branch);
} else {
    tby_branch_entry_handle(_branch, _tb_data);
}

