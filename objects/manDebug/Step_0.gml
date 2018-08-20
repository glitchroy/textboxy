if (keyboard_check_pressed(ord("D"))) global.debug = !global.debug;

//if (!global.debug) exit;

if (keyboard_check_pressed(ord("R"))) game_restart();

if (mouse_check_button_pressed(mb_right)) {
    var size = tbsize_create(mouse_x, mouse_y, 120)
    textbox_queue_create("test01");
    textbox_queue_use("test01");
    textbox_create("[wave]I will present you a choice!", true, size)
    tbchoice_create(
"What should I do?[ev|wait|0.2]",
["Do this!", "Do that!", "Do the [wave]third thing[]"], size)
    textbox_create("Interesting choice....", true, size)
    textbox_queue_run("test01");
}