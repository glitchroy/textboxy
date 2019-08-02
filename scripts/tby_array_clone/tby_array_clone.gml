/// @desc Clones an array by value. Returns the cloned array.
/// @param array
///@func tby_array_clone(array)
var array = argument0;
var first = array[0]; array[0] = first;
return array;