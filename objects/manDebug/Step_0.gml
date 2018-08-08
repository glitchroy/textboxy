if (keyboard_check_pressed(ord("D"))) global.debug = !global.debug;

if (!global.debug) exit;

if (keyboard_check_pressed(ord("R"))) game_restart();

if (mouse_check_button_pressed(mb_right)) {
    textbox_queue_create();
    textbox_create("one", true, [mouse_x, mouse_y])
    textbox_create("two", true, [mouse_x+10, mouse_y])
    textbox_create("three", true, [mouse_x+20, mouse_y])
    textbox_queue_run();
}