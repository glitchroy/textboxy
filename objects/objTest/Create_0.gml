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

tbyAddAction(TbyAction.SetSpeed, 3);
tbyAddAction(TbyAction.SetMaxWidth, 300);
tbyAddAction(TbyAction.SetMaxLines, 1);
tbyAddAction(TbyAction.SetOrigin, 480/2, 0);
tbyAddAction(TbyAction.ShowString,
@"Somewhere,[...] in a codebase far,[..] far away[.].[.].[.].");
tbyAddAction(TbyAction.SetPause, 60);

tbyAddAction(TbyAction.SetSpeed, 2);
tbyAddAction(TbyAction.SetMaxWidth, 150);
tbyAddAction(TbyAction.SetMaxLines, 4);
tbyAddAction(TbyAction.SetSpeaker, id);
tbyAddAction(TbyAction.ShowString,
@"I'm [c1]movin[c0]'!");
tbyAddAction(TbyAction.SetPause, 20);
tbyAddAction(TbyAction.ShowString,
@"And I [j]love[r] it.");
tbyAddAction(TbyAction.ShowString,
@"I just have to say:[...][c2]
[j]Color me[c0] impressed!");

tbyAddAction(TbyAction.SetSpeaker, noone);
tbyAddAction(TbyAction.SetOrigin, 480/2, 0);
tbyAddAction(TbyAction.ShowString,
@"I'm up here now, and I will automatically line break if you don't do it yourself!");
tbyAddAction(TbyAction.ShowString,
@"Nice.");

tbyAddAction(TbyAction.SetSpeaker, id);
tbyAddAction(TbyAction.ShowString,
@"Weeeeeeeeeeeeeee!");

tbyStart();