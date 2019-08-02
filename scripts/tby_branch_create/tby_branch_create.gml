/// @desc Creates a new TbyBranch. Returns the named identifier or a randomly generated one.
/// @param ?branchName = undefined
var branchName = argument_count > 0 ? argument[0] : undefined;

// If no name is given, use random string
if (branchName == undefined) {
    branchName = tby_uuid();
}

// Abort if the name already exists
if (tby_branch_exists(branchName)) {
    tby_log("Can't create TbyBranch \""+ branchName +"\" because it already exists.")
    exit;
}

tby_branch_register(branchName)

// Automatically use the branch
tby_branch_use(branchName)

return branchName