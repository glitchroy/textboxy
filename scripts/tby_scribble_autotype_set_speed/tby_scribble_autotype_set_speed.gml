/// @param textElement
/// @param speed

var _scribble_array = argument0;
var _speed          = argument1;

//Check if this array is a relevant text element
if (!is_array(_scribble_array)
|| (array_length_1d(_scribble_array) != __SCRIBBLE.__SIZE)
|| (_scribble_array[__SCRIBBLE.VERSION] != __SCRIBBLE_VERSION)
|| _scribble_array[__SCRIBBLE.FREED])
{
    if (SCRIBBLE_VERBOSE) show_debug_message("Scribble: Array passed to scribble_autotype_set() is not a valid Scribble text element.");
    exit;
}

//Update the remaining autotype state values
_scribble_array[@ __SCRIBBLE.AUTOTYPE_SPEED     ] = _speed;