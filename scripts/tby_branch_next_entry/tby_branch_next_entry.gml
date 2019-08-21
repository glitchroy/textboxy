/// @desc Calls the next entry on the TbyBranch or destroys it if finished.
/// @param _branch_name 
var _branch_name = argument0;

#region Exit Conditions
if (tby_branch_exists(_branch_name) == false) {
    exit;
}

var _list = tby_branch_get_message_list(_branch_name);

if (tby_list_finished(_list)) {
    //current branch is finished
    //destroy
    tby_branch_destroy(_branch_name)
    
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
    tby_branch_handle_new_list_entry(_branch_name, _tb_data)
}

