/// @function state_switch(state, [pushToStack?])
/// @description [Any Event] Sets the active state of the object.

/// @param {string|script} state The state to switch to by script or string identifier
/// @param {bool} pushToStack? [Default: true] Wether to push the state to the stateStack

var _pushState = true;
if (argument_count > 1) {
	_pushState = argument[1];
}

if (is_real(argument[0])) {
	//you passed a specific script, set it as our next state.
	statePrevious = stateName;
	stateNext = argument[0];
	stateName = ds_map_find_value(stateKeys, argument[0]);
} else {
	//you passed the name of a state, let's try and find it.
	if(ds_map_exists(stateMap,argument[0])) {
		statePrevious = stateName;
		stateNext = ds_map_find_value(stateMap,argument[0]);
		stateName = argument[0]; 
	} else {
		show_debug_message("Tried to switch to a non-existent state.  Moving to first state.")
		stateNext = ds_map_find_first(stateMap);
		stateName = "Unknown (Tried to switch to a non-existant state)";
	}
	
}

if(_pushState) {
	ds_stack_push(stateStack, stateNext);
}
