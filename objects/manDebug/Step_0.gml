if (keyboard_check_pressed(ord("D"))) global.tbyDebug = !global.tbyDebug;

//if (!global.tbyDebug) exit;


if (keyboard_check_pressed(ord("R"))) game_restart();

if (mouse_check_button_pressed(mb_right)) {
    debugSequence = true;
}

if (debugSequence) {
    tby_queue_run("queue1");
}

if (debugSequence && tby_queue_is_finished("queue1")) {
    switch(global.tbyChoiceResult) {
        case 0: tby_queue_run("queue2-0"); break;
        case 1: tby_queue_run("queue2-1"); break;
        case 2: tby_queue_run("queue2-2"); break;
    }
}