/// @desc Creates a new TbyBranch. Returns the named identifier or a randomly generated one.
/// @param ?_branch_name = undefined
var _branch_name = argument_count > 0 ? argument[0] : undefined;

// If no name is given, use random string
if (_branch_name == undefined) {
    _branch_name = tby_uuid();
}

// Abort if the name already exists
if (tby_branch_exists(_branch_name)) {
    tby_log("Can't create TbyBranch \""+ _branch_name +"\" because it already exists.")
    exit;
}

tby_branch_register(_branch_name)

// Automatically use the branch
tby_branch_use(_branch_name)

return _branch_name