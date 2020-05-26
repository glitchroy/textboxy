/// @param _array
function _tby_array_flatten(argument0) {

	// Adapted from
	// https://gist.github.com/AlexandrFadeev/0ba17d104501eacf46bac64da3ed4afc

	var _array = argument0;

	var _flat_array = [];

	for (var i = 0; i < tby_arrlen(_array); i++) {
	    if (is_array(_array[i])) {
	        // Is nested array
	        var _recursion_result = _tby_array_flatten(_array[i]);
	        for (var j = 0; j < tby_arrlen(_recursion_result); j++) {
	            _flat_array[tby_arrlen(_flat_array)] = _recursion_result[j];
	        }
	    } else {
	        // Not a nested array, just append
	        _flat_array[tby_arrlen(_flat_array)] = _array[i];
	    }
	}

	return _flat_array;


}
