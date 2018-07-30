/// @param json
/// @param data array
/// @param changed
/// @param different

//called from text event
//ev|speed|1 (bigger -> slower)
var json = argument0, data = argument1, changed = argument2, different = argument3;

if ( different ) {
    textSpeed = real(data[0]);
}
