/// @function state_init(state)
/// @description [Create Event] Sets the default state for the object.

/// @param {string} state The initial state identifier.

if(is_real(argument[0])) {
	
	state = argument[0];
	stateName = "Unknown (Use the name to switch next time)";
	
} else {
	
	state = ds_map_find_value(stateMap, argument[0]);
	stateName = argument[0];
}

stateNext = state;
ds_stack_push(stateStack, state);
stateNew = true;