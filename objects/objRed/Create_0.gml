#region This code is for handling window resize

windowScale = 2;
windowScaleMax = 4;

var windowWidth = tby_game_width*windowScale;
var windowHeight = tby_game_height*windowScale;

//Change window size and center it
window_set_rectangle(
	(display_get_width() - windowWidth) * 0.5, 
	(display_get_height() - windowHeight) * 0.5, 
	windowWidth,
	windowHeight
);
//Set GUI to always be as big
display_set_gui_size(windowWidth/windowScale,
						windowHeight/windowScale);
	
//Set AppSurface to window size 1:1 for subpixels

surface_resize(application_surface,
		        windowWidth,
				windowHeight);

#endregion

locked = 0;
dir = undefined;
global.inDialoguePause = false

debug_string = 
@"PRESS ENTER OR SPACE TO TALK TO SOMEONE
PRESS F TO SAY SOMETHING
PRESS M TO RESIZE THE WINDOW
PRESS F3 TO TOGGLE DEBUG MODE
PRESS ESC TO CLOSE";

tby_tooltip_create("tby-credits",
                   "example for [c_orange]textboxy v" + tby_version + "[]",
				   -1,
				   false);