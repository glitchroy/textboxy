/// @param _scribble_element
/// @param lines
function _tby_dim_line_height(argument0, argument1) {
	var _scribble_element = argument0, lines = argument1;
	gml_pragma("forceinline");
	return lines * _scribble_element[@ __SCRIBBLE.LINE_HEIGHT];


}
