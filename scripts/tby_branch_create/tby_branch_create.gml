/// @desc Creates a new TbyBranch. Returns the named identifier or a randomly generated one.
/// @param ?_branch_name = undefined
/// @param ?_command_list = undefined
var _branch_name = argument_count > 0 ? argument[0] : undefined;
var _command_list = argument_count > 1 ? argument[1] : undefined;

var _commands = undefined
// Overload: Only action list
if (is_array(_branch_name)) {
    _commands = _branch_name;
}
// If no name is given, use random string
if (_branch_name == undefined || is_string(_branch_name) == false) {
    _branch_name = tby_uuid();
}
// If _command_list is populated, use it
if (is_array(_command_list)) {
    _commands = _command_list
}

// Abort if the name already exists
if (tby_branch_exists(_branch_name)) {
    tby_log("Can't create TbyBranch \""+ _branch_name +"\" because it already exists.")
    exit;
}

tby_branch_register(_branch_name)

// Add commands
tby_branch_nested_array_add(_branch_name, _commands)

return _branch_name