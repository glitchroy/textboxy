/// @param element
/// @param page
function scribble_page_set(argument0, argument1) {

	var _scribble_array = argument0;
	var _page           = argument1;

	_page = clamp(_page, 0, _scribble_array[__SCRIBBLE.PAGES]-1);
	_scribble_array[@ __SCRIBBLE.AUTOTYPE_PAGE] = _page;

	return _page;


}
