var list = global.tby_active_list;

#region Exit Conditions
if (list == undefined || list == -1) {
    exit;
}

if (tby_list_exists(list) == false) exit;

if (tby_list_finished(list)) {
    //current list is finished
    //destroy
    tby_branch_destroy(global.tby_active_list)
    
    tby_hook_branch_finished()
    
    exit;
}
#endregion

//release and create new textbox
var tbData = tby_list_advance(list)

if (tbData == undefined) {
    tby_branch_destroy(list)
} else {
    tby_branch_handle_new_textbox(tbData)
}

