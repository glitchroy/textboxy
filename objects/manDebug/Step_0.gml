if (keyboard_check_pressed(ord("R"))) game_restart();

if (mouse_check_button_pressed(mb_right)) {
    switch(irandom_range(0,1)) {
        case 0: textbox_create("TEST DEBUG\nTEST DEBUG\nTEST DEBUG", true, mouse_x, mouse_y); break;
        case 1: textbox_create("no active", false, mouse_x, mouse_y); break;
    }
	//new TextBox(mouse_x, mouse_y, "TEST DEBUG\nTEST DEBUG\nTEST DEBUG", true)
}