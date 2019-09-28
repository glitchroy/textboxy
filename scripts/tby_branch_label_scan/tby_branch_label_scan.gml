/// @desc Scans the TbyBranch for TbyCmd.Label commands and stores them in the label_map.
/// @param _branch
var _branch = argument0;

var _b/*:TbyBranch*/ = _branch;

if (tby_branch_exists(_b) == false) exit;

var _list/*:TbyList*/ = _b[TbyBranch.message_list];

if (tby_list_exists(_list) == false) exit;

for (var i = 0; i < tby_list_size(_list); i++) {
    var _entry = tby_list_get_entry_at(_list, i);
    if (is_array(_entry) && _entry[0] == TbyCmd.Label) {
        // Found label in list
        var _label_name = _entry[1];
        var _label_position = i;
        
        tby_branch_label_set(_b, _label_name, _label_position);
    }
}