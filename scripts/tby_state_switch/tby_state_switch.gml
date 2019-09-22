/// @function state_switch(state, [pushToStack?])
/// @description [Any Event] Sets the active state of the object.

/// @param {string|script} state The state to switch to by script or string identifier
/// @param {bool} push_to_stack? [Default: true] Wether to push the state to the state_stack

var _push_state = true;
if (argument_count > 1) {
	_push_state = argument[1];
}

if (is_real(argument[0])) {
	//you passed a specific script, set it as our next state.
	state_previous = state_name;
	state_next = argument[0];
	state_name = ds_map_find_value(state_keys, argument[0]);
} else {
	//you passed the name of a state, let's try and find it.
	if(ds_map_exists(state_map,argument[0])) {
		state_previous = state_name;
		state_next = ds_map_find_value(state_map,argument[0]);
		state_name = argument[0]; 
	} else {
		tby_msg("Tried to switch to a non-existent state.  Moving to first state.")
		state_next = ds_map_find_first(state_map);
		state_name = "Unknown (Tried to switch to a non-existant state)";
	}
	
}

if(_push_state) {
	ds_stack_push(state_stack, state_next);
}
