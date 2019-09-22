/// @param _branch_name
/// @param _command_list
var _branch_name = argument0, _command_list = argument1;

// For every entry, do these:
// If not an array, wrap in one
// If an array, check for nested array. If there are nested arrays,
// flatten them

for (var i = 0; i < tby_arrlen(_command_list); i++) {
    var _array_entry = _command_list[i]
    if (is_array(_array_entry) == false) {
        // Bare entry: Add as array
	    tby_branch_message_list_add(_branch_name, [_array_entry])
    } else {
        // Entry is an array itself
        
        // Determine if the array contains further arrays
		if (tby_array_is_shallow(_array_entry)) {
		    // Array does not contain arrays
		    // Append as is
		    tby_branch_message_list_add(_branch_name, _array_entry)
		    
		} else {
		    // Array does contain further arrays
		    // Flatten the structure, then append each
    		var _flattened_entry = tby_array_flatten_shallow(_array_entry);
    		
            for (var j = 0; j < tby_arrlen(_flattened_entry); j++) {
                var _flat_entry = _flattened_entry[j]
                if (!is_array(_flat_entry)) _flat_entry = [_flat_entry]
                
                tby_branch_message_list_add(_branch_name, _flat_entry)
            }
		}
    }
}
