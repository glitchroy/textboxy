
if (locked > 0) {
	locked--;
	exit;
}

if (global.in_dialogue_pause) exit;

/* This is textboxy code */
if (keyboard_check_pressed(ord("F"))) {
	var _s = choose("§[shake]I'm talking[]!", "§Hey there!", "§[wave]Woaoaahh[]!", "§I can't\nbelieve it!")
	;
	var _player_talking = tby_branch_create([
		tby_add_config(TbyConfig.Instance, id),
		_s
	]);
	tby_branch_run(_player_talking, true);
}

#region Movement stuff
//Very rudimentary

var _key_l = (keyboard_check(ord("A")) || keyboard_check(vk_left));
var _key_r = (keyboard_check(ord("D")) || keyboard_check(vk_right));
var _key_u = (keyboard_check(ord("W")) || keyboard_check(vk_up));
var _key_d = (keyboard_check(ord("S")) || keyboard_check(vk_down));
var _key_c = (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter));

var _movement_h = _key_r - _key_l;
var _movement_v = _key_d - _key_u;

enum Dir {
	Up = 90,
	Down = 270,
	Left = 180,
	Right = 0
}

if (_key_l) dir = Dir.Left;  else
if (_key_r) dir = Dir.Right; else
if (_key_u) dir = Dir.Up;    else
if (_key_d) dir = Dir.Down;

if (dir != undefined && _key_c) {
	var _cx = x+8 + lengthdir_x(10, dir);
	var _cy = y+8 + lengthdir_y(10, dir);
	var _c = instance_position(_cx, _cy, obj_blue);
	
	if (_c != noone) {
		with (_c) {
			event_user(0);
		}
	}
}

var _spd = 2;

x += _spd*_movement_h;
if (place_meeting(x, y, obj_blue)) {
	var _d = _movement_h;
	while (place_meeting(x, y, obj_blue)) {
		x -= 1*_d;
	}
}

y += _spd*_movement_v;
if (place_meeting(x, y, obj_blue)) {
	var _d = _movement_v;
	while (place_meeting(x, y, obj_blue)) {
		y -= 1*_d;
	}
}
#endregion