#region This code is not important for textboxy

/*I would usually put this code inside of a
manager object, but to keep this lightweight
the resize code is here*/

if (keyboard_check_pressed(ord("M"))) {
	//Update windowScale
	windowScale++;
	if (windowScale > windowScaleMax) {
		windowScale = 1;
	}
	
	var windowWidth = 480*windowScale;
	var windowHeight = 270*windowScale;
	
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
}
#endregion

x-=0.5;