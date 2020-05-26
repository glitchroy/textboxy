function example_hook_branch_finished() {
#region EXAMPLE CODE
	// This is part of the example:
	global.in_dialogue_pause = false
	with (instance_find(obj_red, 0)) {
		locked = 1;
	}
#endregion


}
