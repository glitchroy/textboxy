/// @desc Clones an array by value. Returns the cloned array.
/// @param _array
///@func tby_array_clone(array)
var _array = argument0;
var _first = _array[0]; _array[0] = _first;
return _array;