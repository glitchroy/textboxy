if (keyboard_check_pressed(ord("D"))) global.debug = !global.debug;

//if (!global.debug) exit;

if (keyboard_check_pressed(ord("R"))) game_restart();

if (mouse_check_button_pressed(mb_right)) {
    var size = tbsize_create(mouse_x, mouse_y, 120)
    textbox_queue_create();
    textbox_create("[wave]What is a man?", true, size)
    textbox_create("A miserable little[ev|wait|0.5] pile of secrets?", true, size)
    textbox_create("But enough talk[ev|wait|0.2].[ev|wait|0.2].[ev|wait|0.2].", true, size)
    textbox_create("[shake]Have at you!", true, size)
    textbox_queue_run();
}