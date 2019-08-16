/// @desc Scans the TbyBranch for TbyType.Label commands and stores them in the LabelMap.
/// @param _branch_name = global.tby_active_branch
var _branch_name = argument_count > 0 ? argument[0] : global.tby_active_branch;

if (tby_branch_exists(_branch_name) == false) {
    exit;
}

var _list = tby_branch_get_message_list(_branch_name);

if (tby_list_exists(_list) == false) exit;

for (var i = 0; i < tby_list_size(_list); i++) {
    var _entry = tby_list_get_entry_at(_list, i);
    if (is_array(_entry) && _entry[0] == TbyType.Label) {
        // Found label in list
        var _label_name = _entry[1];
        var _label_position = i;
        
        tby_branch_set_label(_branch_name, _label_name, _label_position);
    }
}