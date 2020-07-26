function tby_init(){
	if (scribble_init("textboxy/fonts", "font_tby_default", false)) {
		scribble_add_font("font_tby_default");
		scribble_add_font("font_tby_debug");
	}
}