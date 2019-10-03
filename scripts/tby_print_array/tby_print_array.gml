/// @param _arr
var _arr = argument0;

var _s = "[ ";

for (var i = 0; i < tby_arrlen(_arr); i++) {
	var _representation = string(_arr[i]);
	if (is_array(_arr[i])) _representation = tby_print_array(_arr[i]);
	
	_s += _representation;
	if (i != tby_arrlen(_arr)-1) _s += ", ";
}

return _s + " ]";