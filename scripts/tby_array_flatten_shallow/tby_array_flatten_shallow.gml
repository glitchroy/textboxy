/// @desc Flatten array, but keep the lowest nesting. Used for deconstructing nested TbyBranches.
/// @param _array

// Adapted from
// https://gist.github.com/AlexandrFadeev/0ba17d104501eacf46bac64da3ed4afc

var _array = argument0;

var _flat_array = [];

for (var i = 0; i < tby_arrlen(_array); i++) {
    var _element = _array[i]
    if (is_array(_element)) {
        // Scan if the array only contains arrays, not further nested ones
        if (tby_array_is_shallow(_element)) {
            _flat_array[tby_arrlen(_flat_array)] = _element
        } else {
            // Is nested array
            var _recursion_result = tby_array_flatten_shallow(_element);
            for (var j = 0; j < tby_arrlen(_recursion_result); j++) {
                _flat_array[tby_arrlen(_flat_array)] = _recursion_result[j];
            }
        }
    } else {
        // Raw value, just append as array
        
        // Add to array if single raw value
        if (tby_arrlen(_array) <= 1) {
            _element = [_element]
        }
        
        _flat_array[tby_arrlen(_flat_array)] = _element
    }
}

return _flat_array