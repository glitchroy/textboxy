/// @desc Shorthand to add a TbyCmd.Script to the active TbyBranch.
/// @param _script
/// @param ...
function tby_add_script() {
	var _script = argument[0];

	var _return = [TbyCmd.Script, _script];
	for (var i = 1; i < argument_count; i++) {
	    _return[@ tby_arrlen(_return)] = argument[i];
	}

	return _return;


}
