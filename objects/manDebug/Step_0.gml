if (keyboard_check_pressed(ord("R"))) game_restart();

if (mouse_check_button_pressed(mb_left)) {
	instance_create_layer(mouse_x, mouse_y, "Instances", objTesting);
}