/// @function state_update()
/// @description [End Step Event] Handles state switching for an object.


if(state_next != state) {
	state = state_next;
	state_timer = 0;
	state_new = true;
} else {
	state_timer++;
	state_new = false;
}
