/// @param branchName = global.tby_active_branch
var branchName = argument_count > 0 ? argument[0] : global.tby_active_branch;

#region Exit Conditions
if (tby_branch_exists(branchName) == false) {
    exit;
}

var list = tby_branch_get_message_list(branchName);

if (tby_list_finished(list)) {
    //current branch is finished
    //destroy
    tby_branch_destroy(branchName)
    
    tby_hook_branch_finished()
    
    exit;
}
#endregion

//release and create new textbox
var tbData = tby_list_advance(list)

if (tbData == undefined) {
    tby_branch_destroy(branchName)
} else {
    tby_branch_handle_new_list_entry(branchName, tbData)
}

