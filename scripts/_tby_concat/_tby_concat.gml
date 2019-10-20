/// @func tby_concat(arrayA, arrayB)
/// @desc Appends the values of one array to another.
/// @param {Array} baseArray The array to append to
/// @param {Array} arrayToAppend The array to append
/// @returns {Array} The concatenated array
/*
@example
_tby_concat([0, 1, 2], [3, 4, 5]);
// => [0, 1, 2, 3, 4, 5]
*/

//by https://github.com/gm-core/gdash/blob/master/src/scripts/_concat/_concat.gml

var _n = array_length_1d(argument0);
var _arr = _tby_array_clone(argument0);

for (var i = array_length_1d(argument1) - 1; i >= 0; i--) {
    _arr[@ _n+i] = argument1[@ i]; 
}

return _arr;