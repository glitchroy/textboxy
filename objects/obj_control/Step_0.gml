tby_do_step();

// example code to make debugging life easier
if (keyboard_check_pressed(ord("M"))) {
	window_scale++;
	if (window_scale > window_scale_max) window_scale = 1;
	debug_resize(window_scale, window_scale_max);
}

if (keyboard_check_pressed(vk_escape)) game_end();
if (keyboard_check_pressed(ord("R"))) game_restart();
if (keyboard_check_pressed(vk_f3)) global.tby_debug = !global.tby_debug;
