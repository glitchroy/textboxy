/// @desc Flatten array, but keep the lowest nesting. Used for deconstructing nested TbyBranches.
/// @param _array

// Adapted from
// https://gist.github.com/AlexandrFadeev/0ba17d104501eacf46bac64da3ed4afc

var _array = argument0;

var _flat_array = [];

if (!is_array(_array)) return [_array];

for (var i = 0; i < tby_arrlen(_array); i++) {
    var _array_entry = _array[i];
    
    if (is_array(_array_entry)) {
        // Entry is an array
        
        // Scan if the array contains further arrays
        if (tby_array_is_shallow(_array_entry)) {
            // Array does not contain arrays

            // Append as is
            _flat_array[tby_arrlen(_flat_array)] = _array_entry;
            
        } else {
            // Array does contain other arrays
            // Work down the tree
            var _recursion_result = tby_array_flatten_shallow(_array_entry);
            for (var j = 0; j < tby_arrlen(_recursion_result); j++) {
                _flat_array[tby_arrlen(_flat_array)] = _recursion_result[j];
            }
        }
        
    } else {
        // Entry is bare
        _flat_array[tby_arrlen(_flat_array)] = [_array_entry];
    }
}

return _flat_array;