if (keyboard_check_pressed(ord("D"))) global.debug = !global.debug;

//if (!global.debug) exit;


if (keyboard_check_pressed(ord("R"))) game_restart();

if (mouse_check_button_pressed(mb_right)) {
    var qn = "q"+string(random_range(0, 10000))
    var size = tbsize_create(mouse_x, mouse_y, 120)
    textbox_queue_create(qn);
    textbox_queue_use(qn);
    /*
    new TextBox("[wave]I will present you a choice!", true, size)
    new TBChoice(
"What should I do?[ev|wait|0.2]",
["Do this!", "Do that!", "Do the [wave]third thing[]"], size)
    new TextBox("Interesting choice....", true, size)*/
    textbox_queue_add(TBType.Normal, ["[wave]I will present you a choice!", true, size])
    textbox_queue_add(TBType.Choice, 
["What should I do?[ev|wait|0.2]",
["Do this!", "Do that!", "Do the [wave]third thing[]"], size])
    textbox_queue_add(TBType.Normal, ["Interesting choice....", true, size])
    textbox_queue_run(qn);
}