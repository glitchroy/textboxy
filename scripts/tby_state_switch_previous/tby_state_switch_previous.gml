/// @function state_switch_previous()
/// @description [Any Event] Sets the state to the previous state of the stateStack.

ds_stack_pop(stateStack);

var _state=ds_stack_top(stateStack);
tby_state_switch(_state, false);