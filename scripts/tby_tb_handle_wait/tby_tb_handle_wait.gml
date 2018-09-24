/// @param json
/// @param data array
/// @param changed
/// @param different

//called from text event
//ev|wait|1 (in seconds)
var json = argument0, data = argument1, changed = argument2, different = argument3;

if ( different ) {
	waitTimer = room_speed*real(data[0]);
	tby_state_switch("Waiting")
}
