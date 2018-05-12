if (keyboard_check_pressed(ord("R"))) game_restart();

if (mouse_check_button(mb_left)) {
	objTest.x = mouse_x;
	objTest.y = mouse_y;
}