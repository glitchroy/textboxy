/// @param _y
var _y = argument0;

var _cam = tby_game_camera;
var _cy = 0;

if (_cam != -1) {
    _cy = camera_get_view_y(_cam);
}

return _y - _cy;