/// @function stateSwitchPrevious()
/// @description [Any Event] Sets the state to the previous state of the stateStack.

ds_stack_pop(stateStack);

var _state=ds_stack_top(stateStack);
state_switch(_state, false);