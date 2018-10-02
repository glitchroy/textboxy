if (keyboard_check_pressed(ord("D"))) global.tbyDebug = !global.tbyDebug;

//if (!global.tbyDebug) exit;

if (keyboard_check_pressed(ord("R"))) {
    game_restart();
}

if (keyboard_check_pressed(ord("E"))) {
    size = tby_size_create(100, 100)
    tby_queue_create("queue1");
    tby_queue_use("queue1");
    tby_queue_add(TbyType.Normal, ["Desch is ja lollig#joa mey", true, size])
    tby_queue_run("queue1");
}