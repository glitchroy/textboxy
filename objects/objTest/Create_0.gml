#region This code is not important for textboxy

windowScale = 2;
windowScaleMax = 4;

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

#endregion

/* You can use @"string" to create a string literal
Look at the documentation for more info */
tby(id, "But this will!");
tbyStart();

/*
tby(id, 5, "Hi du ei");
tbyPause(20);
tbyAddAction(TbyAction.SetMaxWidth, 150);
tbyAddAction(TbyAction.SetMaxLines, 4);
tby("Hi");
tbyAddAction(TbyAction.SetPosition, 100, 100);
tby("Whadup\nDadup");
tbyAddAction(TbyAction.SetOrigin, 100, 100);
tby("Whadup\nDamn");
tby(id, 10, "Slo");
tby("Yoho yhoo");
tby(noone, "Still slow tho");
tbyStart();
//alarm[0] = 50;