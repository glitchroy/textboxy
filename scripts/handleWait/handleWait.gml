/// @param json
/// @param data(array)
/// @param changed
/// @param different_event

var json      = argument0;
var data      = argument1;
var changed   = argument2;
var different = argument3;

if ( different ) {
    waiting = true;
	var w = room_speed*real(data[0]);
	alarm[0] = max(1,w);
}
