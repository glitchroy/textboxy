#region This code is for handling window resize

/*I would usually put this code inside of a
manager object, but to keep this lightweight
the resize code is here*/

if (keyboard_check_pressed(ord("M"))) {
	//Update window_scale
	window_scale++;
	if (window_scale > window_scale_max) {
		window_scale = 1;
	}
	
	var _window_width = tby_game_width*window_scale;
	var _window_height = tby_game_height*window_scale;
	
	//Change window size and center it
	window_set_rectangle(
		(display_get_width() - _window_width) * 0.5, 
		(display_get_height() - _window_height) * 0.5, 
		_window_width,
		_window_height
	);
	
	//Set GUI to always be as big
	display_set_gui_size(_window_width/window_scale,
						 _window_height/window_scale);
	
	//Set AppSurface to window size 1:1 for subpixels
	
	surface_resize(application_surface,
			        _window_width,
					_window_height);
}
#endregion

#region Command stuff
if (keyboard_check_pressed(vk_escape)) game_end();

//if (keyboard_check_pressed(ord("R"))) game_restart();

if (keyboard_check_pressed(vk_f3)) {
	global.tby_debug = !global.tby_debug;
}
#endregion

if (locked > 0) {
	locked--;
	exit;
}

if (global.in_dialogue_pause) {
	exit;
}
/* This is textboxy code */
if (keyboard_check_pressed(ord("F"))) {
	var _s = choose("§[shake]I'm talking[]!", "§Hey there!", "§[wave]Woaoaahh[]!", "§I can't\nbelieve it!");
	var _player_talking = tby_branch_create([
		tby_branch_config(TbyConfig.Instance, id),
		_s
	]);
	tby_branch_run(_player_talking, true);
}

var _cam = tby_game_camera;
var _cx, _cy = 0;
if (_cam != -1) {
    _cx = camera_get_view_x(_cam);
    _cy = camera_get_view_y(_cam);
}

#region Movement stuff
//Very rudimentary

if (!variable_global_exists("pause")) global.pause = false;
if (global.pause) exit;

var _key_l = (keyboard_check(ord("A")) || keyboard_check(vk_left));
var _key_r = (keyboard_check(ord("D")) || keyboard_check(vk_right));
var _key_u = (keyboard_check(ord("W")) || keyboard_check(vk_up));
var _key_d = (keyboard_check(ord("S")) || keyboard_check(vk_down));
var _key_c = (keyboard_check_pressed(vk_space) ||
            keyboard_check_pressed(vk_enter));

var _movement_h = _key_r - _key_l;
var _movement_v = _key_d - _key_u;

enum Dir {
	Up = 90,
	Down = 270,
	Left = 180,
	Right = 0
}
if (_key_l) dir = Dir.Left; else
if (_key_r) dir = Dir.Right; else
if (_key_u) dir = Dir.Up; else
if (_key_d) dir = Dir.Down;

if (dir != undefined && _key_c) {
	var _cx = x+8 + lengthdir_x(10, dir);
	var _cy = y+8 + lengthdir_y(10, dir);
	var _c = instance_position(_cx, _cy, objBlue);
	
	if (_c != noone) {
		with (_c) {
			event_user(0);
		}
	}
}

var _spd = 2;

x += _spd*_movement_h;
if (place_meeting(x, y, objBlue)) {
	var _d = _movement_h;
	while (place_meeting(x, y, objBlue)) {
		x -= 1*_d;
	}
}

y += _spd*_movement_v;
if (place_meeting(x, y, objBlue)) {
	var _d = _movement_v;
	while (place_meeting(x, y, objBlue)) {
		y -= 1*_d;
	}
}
#endregion
