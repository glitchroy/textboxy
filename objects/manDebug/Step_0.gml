if (keyboard_check_pressed(ord("R"))) game_restart();

if (mouse_check_button(mb_left)) {
	var m = tbyM();
	m.ox = device_mouse_raw_x(0);
	m.oy = device_mouse_raw_y(0);
}