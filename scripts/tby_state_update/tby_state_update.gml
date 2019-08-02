/// @function state_update()
/// @description [End Step Event] Handles state switching for an object.


if(stateNext != state) {
	state = stateNext;
	stateTimer = 0;
	stateNew = true;
} else {
	stateTimer++;
	stateNew = false;
}
