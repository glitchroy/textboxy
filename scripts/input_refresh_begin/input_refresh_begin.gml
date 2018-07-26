//This script clears the momentary state for each input slot
//The "input_handle_*" functions modify these values
for( var _i = 0; _i < E_INPUT_SLOT.__SIZE; _i++ ) {
	input_state[ _i, E_INPUT_STATE.NEW_ON ]            = false;
	input_state[ _i, E_INPUT_STATE.NEW_PRESSED_INDEX ] = undefined;
}