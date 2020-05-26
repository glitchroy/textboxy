/// @function state_switch_previous()
/// @description [Any Event] Sets the state to the previous state of the state_stack.
function _tby_state_switch_previous() {

	ds_stack_pop(state_stack);

	var _state=ds_stack_top(state_stack);
	_tby_state_switch(_state, false);


}
