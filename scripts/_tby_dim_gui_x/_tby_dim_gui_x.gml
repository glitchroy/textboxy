/// @param _x
function _tby_dim_gui_x(argument0) {
	var _x = argument0;

	var _cam = tby_game_camera;
	var _cx = 0;

	if (_cam != -1) {
	    _cx = camera_get_view_x(_cam);
	}

	return _x - _cx;


}
