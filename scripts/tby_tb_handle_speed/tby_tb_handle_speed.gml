/// @desc Scribble event. Handles the speed command.
/// @param _json
/// @param _data_array
/// @param _changed
/// @param _different

//called from text event
//[speed|1] (bigger -> slower)
var _json = argument0, _data = argument1, _changed = argument2, _different = argument3;

if (_different) {
    typewriter_speed = real(data[0]);
    // TODO: Ugly access to typewriter speed property
    _json[| __SCRIBBLE.TW_SPEED] = typewriter_speed
}
