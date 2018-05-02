///@function tbyArrayToMap(array)
///@desc Returns a map of the given array, with 0 = key, 1 = val ...
///@param array

// If the array has odd entries, the last entry will be skipped

var a = argument0;
var map = ds_map_create();

var key;
for (var i = 0; i < array_length_1d(a); i++) {
	if (i mod 2 == 0) {
		key = a[i];
		continue;
	} else {
		//got value
		map[? key] = a[i];
	}
}

return map;