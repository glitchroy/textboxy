/// @desc Scans the TbyBranch for TbyCmd.Label commands and stores them in the label_map.
/// @param _branch
function _tby_branch_label_scan(argument0) {
	var _branch/*:TbyBranch*/ = argument0;

	if (_tby_branch_exists(_branch) == false) exit;

	var _list/*:TbyList*/ = _branch[TbyBranch.message_list];

	if (_tby_list_exists(_list) == false) exit;

	for (var i = 0; i < _tby_list_size(_list); i++) {
	    var _entry = _tby_list_get_entry_at(_list, i);
	    if (is_array(_entry) && _entry[0] == TbyCmd.Label) {
	        // Found label in list
	        var _label_name = _entry[1];
	        var _label_position = i;
        
	        _tby_branch_label_set(_branch, _label_name, _label_position);
	    }
	}


}
