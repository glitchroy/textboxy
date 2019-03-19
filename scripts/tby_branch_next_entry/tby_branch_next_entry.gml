var q = tby_branch_get_active_id()

#region Exit Conditions
if (q == undefined || q == -1) {
    exit;
}

if (tby_list_exists(q) == false) exit;

if (tby_list_finished(q)) {
    //current list is finished
    //destroy
    tby_branch_destroy(global.tby_active_list_name)
    
    tby_hook_branch_finished()
    
    exit;
}
#endregion

//release and create new textbox
var tbData = tby_list_advance(q)

if (tbData == undefined) {
    tby_branch_destroy(global.tby_active_list_name)
} else {
    tby_branch_handle_new_textbox(tbData)
}

