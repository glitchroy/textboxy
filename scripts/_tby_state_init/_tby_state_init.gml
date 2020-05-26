/// @function state_init(state)
/// @description [Create Event] Sets the default state for the object.
function _tby_state_init() {

	/// @param {string} state The initial state identifier.

	if(is_real(argument[0])) {
	
		state = argument[0];
		state_name = "Unknown (Use the name to switch next time)";
	
	} else {
	
		state = ds_map_find_value(state_map, argument[0]);
		state_name = argument[0];
	}

	state_next = state;
	ds_stack_push(state_stack, state);
	state_new = true;


}
