if (keyboard_check_pressed(ord("R"))) game_restart();

if (mouse_check_button_pressed(mb_right)) {
	var str= @"[wave]What is a man?[][ev|wait|0.5]
	A miserable little [ev|wait|0.25]pile of [c_red]secrets[]?[ev|wait|0.5]
	[ev|speed|4]But enough talk...[ev|speed|1][ev|wait|0.5][wave] Have at you![]"

    textbox_create(str, true, [mouse_x, mouse_y])
	//new TextBox(mouse_x, mouse_y, "TEST DEBUG\nTEST DEBUG\nTEST DEBUG", true)
}