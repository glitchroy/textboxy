
if (room != room_first) {

textbox_create(
@"You are standing in a room.[ev|wait|0.5] You hear shouting coming from outside.[ev|wait|0.5]

What do you want to do?[ev|wait|0.5]
[iconNumber|1] [c_command]Check[] the [c_thing][iconThing|0] door[]
[iconNumber|2] [c_command]Check[] the [c_thing][iconThing|1] window[]",
false, tbsize_create(0, 0, gameWidth, gameHeight-100, 30)) //, gameWidth, gameHeight-150, 10
}
