/// @param _array
var _array = argument0;

var _is_shallow_array = true;
for (var i = 0; i < tby_arrlen(_array); i++) {
    if (is_array(_array[i])) {
        _is_shallow_array = false;
        break;
    }
}

return _is_shallow_array