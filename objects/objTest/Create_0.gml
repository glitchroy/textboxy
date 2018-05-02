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

tbyAddAction(TbyAction.SetMaxWidth, 150);
tbyAddAction(TbyAction.SetMaxLines, 4);
tbyAddAction(TbyAction.SetSpeaker, id);
tbyAddAction(TbyAction.SetSpeed, 3);
tbyAddAction(TbyAction.ShowString,
@"What is a man?");
tbyAddAction(TbyAction.SetPause, 15);
tbyAddAction(TbyAction.SetSpeed, 1);
tbyAddAction(TbyAction.ShowString,
@"A [c/red]miserable little pile of secrets[r]?[...]
But enough talk[.].[.].[.].");
tbyAddAction(TbyAction.SetPause, 30);
tbyAddAction(TbyAction.SetSpeed, 3);
tbyAddAction(TbyAction.ShowString,
@"[j]Have at you!");
//tbyAddAction(TbyAction.ShowString,
//@"Test[.][c2][j]Color me[c0][...]i[.]m[r][.]p[.]ressed!");

tbyStart();