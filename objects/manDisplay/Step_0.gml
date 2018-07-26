#region Zooming Window
if (keyboard_check_pressed(ord("M")) && allowResizing) {
	//Update windowScale
	windowScale++;
	if (windowScale > windowScaleMax) {
		windowScale = 1;
	}
	
	var windowWidth = gameWidth*windowScale;
	var windowHeight = gameHeight*windowScale;
	
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
	
	//Set timer
	allowResizing = false;
	alarm[0] = 4;
}
#endregion