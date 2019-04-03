/// @param branchName = global.tby_active_branch
var branchName = argument_count > 0 ? argument[0] : global.tby_active_branch;

if (tby_branch_exists(branchName) == false) {
    exit;
}

var list = tby_branch_get_message_list(branchName);

if (tby_list_exists(list) == false) exit;

for (var i = 0; i < tby_list_size(list); i++) {
    var entry = tby_list_get_entry_at(list, i);
    if (is_array(entry) && entry[0] == TbyType.Label) {
        // Found label in list
        var labelName = entry[1];
        var labelPosition = i;
        
        tby_branch_set_label(branchName, labelName, labelPosition);
    }
}