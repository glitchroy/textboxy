if (keyboard_check_pressed(ord("D"))) global.tbyDebug = !global.tbyDebug;

//if (!global.tbyDebug) exit;


if (keyboard_check_pressed(ord("R"))) game_restart();

if (mouse_check_button_pressed(mb_right)) {
    var qn = "q"+string(random_range(0, 10000))
    var size = tby_size_create(mouse_x, mouse_y, 120)
    tby_queue_create(qn);
    tby_queue_use(qn);

    tby_queue_add(TbyType.Normal, ["[wave]I will present you a choice!", true, size])
    tby_queue_add(TbyType.Choice, 
["What should I do?[ev|wait|0.2]",
["Do this!", "Do that!", "Do the [wave]third thing[]"], size])
    tby_queue_add(TbyType.Normal, ["Interesting choice....", true, size])
    
    tby_queue_run(qn);
}