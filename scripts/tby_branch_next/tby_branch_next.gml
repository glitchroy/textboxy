/// @desc Calls the next entry on the TbyBranch or destroys it if finished.
/// @param _branch_name 
var _branch_name = argument0;

#region Exit Conditions
if (tby_branch_exists(_branch_name) == false) {
    exit;
}

var _list = tby_branch_message_list_get(_branch_name);

if (tby_list_finished(_list)) {
    //current branch is finished
    
    var _branch = tby_branch_get(_branch_name);
    var _destroy_on_finish = _branch[TbyBranch.DestroyOnFinish];
    
    if (_destroy_on_finish) {
        tby_branch_destroy(_branch_name);
    } else {
        // Reset branch
        tby_list_reset(_list)
    }

    tby_hook_branch_finished()
    
    exit;
}
#endregion

//release and create new textbox
var _tb_data = tby_list_advance(_list)

if (_tb_data == undefined) {
    tby_log("Found undefined entry in TbyList. Destroying TbyBranch.")
    tby_branch_destroy(_branch_name)
} else {
    tby_branch_entry_handle(_branch_name, _tb_data)
}

