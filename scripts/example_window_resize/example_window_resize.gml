/// @param _window_scale
/// @param _window_scale_max
var _window_scale = argument0, _window_scale_max = argument1;

//Update window_scale
_window_scale++;
if (_window_scale > _window_scale_max) _window_scale = 1;

var _window_width = tby_game_width * _window_scale;
var _window_height = tby_game_height * _window_scale;

//Change window size and center it
window_set_rectangle(
    (display_get_width() - _window_width) * 0.5, 
    (display_get_height() - _window_height) * 0.5, 
    _window_width,
    _window_height
);

//Set GUI to always be as big
display_set_gui_size(_window_width/_window_scale, _window_height/_window_scale);

//Set AppSurface to window size 1:1 for subpixels
surface_resize(application_surface, _window_width, _window_height);

return _window_scale;