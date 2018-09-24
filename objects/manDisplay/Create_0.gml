singleton;

windowScale = 2;
windowScaleMax = 3;

allowSubpixels = false;
allowResizing = true; //timer for adjusting

window_set_color(c_black);

// INITAL SETUP //
var windowWidth = game_width*windowScale;
var windowHeight = game_height*windowScale;
	
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
if (allowSubpixels) {
	surface_resize(application_surface,
		            windowWidth,
					windowHeight);
}