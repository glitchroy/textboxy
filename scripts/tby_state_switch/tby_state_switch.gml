/// @function state_switch(state, [pushToStack?])
/// @description [Any Event] Sets the active state of the object.
/// @param _state The state to switch to by script or string identifier
/// @param _push_state = true
var _state = argument[0];
var _push_state = argument_count > 1 ? argument[1] : true;

if (is_real(_state)) {
	//you passed a specific script, set it as our next state.
	state_previous = state_name;
	state_next = _state;
	state_name = ds_map_find_value(state_keys, _state);
} else {
	//you passed the name of a state, let's try and find it.
	if(ds_map_exists(state_map, _state)) {
		state_previous = state_name;
		state_next = ds_map_find_value(state_map, _state);
		state_name = _state; 
	} else {
		tby_msg("Tried to switch to a non-existent state.  Moving to first state.");
		state_next = ds_map_find_first(state_map);
		state_name = "Unknown (Tried to switch to a non-existant state)";
	}
	
}

if(_push_state) {
	ds_stack_push(state_stack, state_next);
}
