/// @function state_execute()
/// @description [Step Event] Executes active state script.
function _tby_state_execute() {

	if (script_exists(state)) {
	
		script_execute(state);
	
	} else {
	
		_tby_state_switch(ds_map_find_first(state_map));
	
	}


}
