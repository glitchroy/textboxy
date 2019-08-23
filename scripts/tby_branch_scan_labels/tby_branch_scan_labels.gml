/// @desc Scans the TbyBranch for TbyCmd.Label commands and stores them in the LabelMap.
/// @param _branch_name 
var _branch_name = argument0;

if (tby_branch_exists(_branch_name) == false) {
    exit;
}

var _list = tby_branch_get_message_list(_branch_name);

if (tby_list_exists(_list) == false) exit;

for (var i = 0; i < tby_list_size(_list); i++) {
    var _entry = tby_list_get_entry_at(_list, i);
    if (is_array(_entry) && _entry[0] == TbyCmd.Label) {
        // Found label in list
        var _label_name = _entry[1];
        var _label_position = i;
        
        tby_branch_set_label(_branch_name, _label_name, _label_position);
    }
}