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

var s = 
@"PRESS [c_orange]ENTER[] OR [c_orange]SPACE[] TO TALK TO SOMEONE
PRESS [c_orange]F[] TO SAY SOMETHING
PRESS [c_orange]M[] TO RESIZE THE WINDOW
PRESS [c_orange]F3[] TO TOGGLE DEBUG MODE
PRESS [c_orange]ESC[] TO CLOSE";

var s2 = "example for [c_orange]textboxy v" + tby_version + "[]"

scrib1 = scribble_create(s, tby_game_width, "sprTbyFontSmall", fa_left, tby_default_color);
scrib2 = scribble_create(s2, tby_game_width, "sprTbyFontMain", fa_left, tby_default_color);
scribd = scribble_create("[c_ltgray]DEBUG MODE ON[]", tby_game_width, "sprTbyFontSmall")

var box1 = scribble_get_box(scrib1, 2, 2, 2, 2)
box1w = box1[2] - box1[0];
box1h = box1[3] - box1[1]

var box2 = scribble_get_box(scrib2, 2, 2, 2, 2)
box2w = box2[2] - box2[0];
box2h = box2[3] - box2[1]