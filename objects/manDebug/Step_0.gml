if (keyboard_check_pressed(ord("R"))) game_restart();

if (mouse_check_button(mb_left)) {
	objTest.x = mouse_x;
	objTest.y = mouse_y;
}

if (keyboard_check_pressed(ord("P"))) {
	log("0")
	tbyReset();
	log("1")
	tbyAddAction(TbyAction.SetPosition, 100, 100);
	tby(objTest, "Zwei");
	log("2")
	tbyAddAction(TbyAction.SetMaxWidth, 150);
	tbyAddAction(TbyAction.SetMaxLines, 4);
	tby("Hi");
	tbyAddAction(TbyAction.SetPosition, 100, 100);
	tby("Whadup\nDadup");
	tbyAddAction(TbyAction.SetOrigin, 100, 100);
	tby("Whadup\nDamn");
	tby(objTest, 10, "Slo");
	tby("Yoho yhoo");
	tby(noone, "Still slow tho");
	tbyStart();
}