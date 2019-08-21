/// @desc Creates a new TbyBranch. Returns the named identifier or a randomly generated one.
/// @param ?_branch_name = undefined
/// @param ?_action_list = undefined
var _branch_name = argument_count > 0 ? argument[0] : undefined;
var _action_list = argument_count > 1 ? argument[1] : undefined;

var _actions = undefined
// Overload: Only action list
if (is_array(_branch_name)) {
    _actions = _branch_name;
}
// If no name is given, use random string
if (_branch_name == undefined || is_string(_branch_name) == false) {
    _branch_name = tby_uuid();
}
// If _action_list is populated, use it
if (is_array(_action_list)) {
    _actions = _action_list
}

// Abort if the name already exists
if (tby_branch_exists(_branch_name)) {
    tby_log("Can't create TbyBranch \""+ _branch_name +"\" because it already exists.")
    exit;
}

tby_branch_register(_branch_name)

// For every entry, do these
// If not an array, wrap in one
// If an array, check for nested array. If there are nested arrays,
// flatten them
for (var i = 0; i < tby_arrlen(_actions); i++) {
    var _action = _actions[i]
    
    if (is_array(_action) == false) {
        tby_branch_add_to_message_list(_branch_name, [_action])
    } else {
        var _flattened_actions = tby_array_flatten_shallow(_action);
		//tby_branch_add_to_message_list(_branch_name, _flattened_actions)
		if (tby_array_is_shallow(_flattened_actions)) {
		    tby_branch_add_to_message_list(_branch_name, _flattened_actions)
		} else {
        for (var j = 0; j < tby_arrlen(_flattened_actions); j++) {
            var _flat_action = _flattened_actions[j]
            if (!is_array(_flat_action)) _flat_action = [_flat_action]
            tby_branch_add_to_message_list(_branch_name, _flat_action)
        }
		}
    }
}

return _branch_name