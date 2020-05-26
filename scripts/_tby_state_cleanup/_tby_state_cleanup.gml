/// @function state_cleanup()
/// @description [Clean Up Event] Destroys state data structures.
function _tby_state_cleanup() {

	if (ds_exists(state_map, ds_type_map)) {
	    ds_map_destroy(state_map);
	}

	if (ds_exists(state_keys, ds_type_map)) {
	    ds_map_destroy(state_keys);
	}

	if (ds_exists(state_stack, ds_type_stack)) {
	    ds_stack_destroy(state_stack);
	}


}
