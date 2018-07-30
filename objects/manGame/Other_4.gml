if (room != room_first) {
    textbox_create("[sCoin]You are standing in a room.[ev|wait|0.5]\nWhat do you want to do?[ev|wait|0.5]\n\n\n[c_red]1[] Check the door#[c_red]2[] Check the window", false, tbsize_create(0, 0, gameWidth, gameHeight-150, 10))
    textbox_create("lol", true)
}