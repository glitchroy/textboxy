global.in_dialogue_pause = false;

window_scale = 2;
window_scale_max = 4;

#region Window resize
var _window_width = tby_game_width * window_scale;
var _window_height = tby_game_height * window_scale;

//Change window size and center it
window_set_rectangle(
    (display_get_width() - _window_width) * 0.5, 
    (display_get_height() - _window_height) * 0.5, 
    _window_width,
    _window_height
);
//Set GUI to always be as big
display_set_gui_size(_window_width/window_scale, _window_height/window_scale);
    
//Set AppSurface to window size 1:1 for subpixels
surface_resize(application_surface, _window_width, _window_height);
#endregion

#region Debug
debug_string = 
@"PRESS ENTER OR SPACE TO TALK TO SOMEONE
PRESS F TO SAY SOMETHING
PRESS M TO RESIZE THE WINDOW
PRESS F3 TO TOGGLE DEBUG MODE
PRESS ESC TO CLOSE";

version_string = "example for textboxy";
#endregion