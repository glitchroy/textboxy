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

if (keyboard_check_pressed(ord("R"))) game_restart();

if (keyboard_check_pressed(ord("F"))) {
	var s = choose("I'm talking!", "Hey there!", "Woaoaahh!");
	tbyReset();
	tby(id, 2, s);
	tbyStart();
}

depth = -y;

if (!variable_global_exists("pause")) global.pause = false;
if (global.pause) exit;

var keyL = (keyboard_check(ord("A")) || keyboard_check(vk_left))
var keyR = (keyboard_check(ord("D")) || keyboard_check(vk_right))
var keyU = (keyboard_check(ord("W")) || keyboard_check(vk_up))
var keyD = (keyboard_check(ord("S")) || keyboard_check(vk_down))
var keyC = (keyboard_check_pressed(vk_space) ||
            keyboard_check_pressed(vk_enter))

var movementH = keyR - keyL;
var movementV = keyD - keyU;

enum Dir {
	Up = 90,
	Down = 270,
	Left = 180,
	Right = 0
}
if (keyL) dir = Dir.Left else
if (keyR) dir = Dir.Right else
if (keyU) dir = Dir.Up else
if (keyD) dir = Dir.Down;

if (dir != undefined && keyC) {
	var cx = x+8 + lengthdir_x(10, dir);
	var cy = y+8 + lengthdir_y(10, dir);
	var c = instance_position(cx, cy, objBlue);
	
	if (c != noone) {
		with (c) {
			event_user(0);
		}
	}
}

var spd = 2;

x += spd*movementH;
if (place_meeting(x, y, objBlue)) {
	var d = movementH;
	while (place_meeting(x, y, objBlue)) {
		x -= 1*d;
	}
}

y += spd*movementV;
if (place_meeting(x, y, objBlue)) {
	var d = movementV;
	while (place_meeting(x, y, objBlue)) {
		y -= 1*d;
	}
}
