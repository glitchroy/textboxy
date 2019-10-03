/// @param _compare_a
/// @param _comparison
/// @param _compare_b
/// @param _if_true
/// @param _if_false
var _compare_a = argument0, _comparison = argument1, _compare_b = argument2, _if_true = argument3, _if_false = argument4;

var _clear_key = "COND-1.0-" + string(_compare_a) + string(_comparison) +
                 string(_compare_b) + string(_if_true) + string(_if_false);

var _key = md5_string_unicode(_clear_key);

// Exit if key already exists
if (ds_map_exists(global.tby_conditions, _key)) return _key;

var _val = [
    _compare_a, _comparison, _compare_b,
    _if_true,
    _if_false
];



global.tby_conditions[? _key] = _val;

return _key;