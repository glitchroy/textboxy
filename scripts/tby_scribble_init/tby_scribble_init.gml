/// @desc This script is used to load scribble and configure it.
function tby_scribble_init() {
	scribble_init("Fonts", tby_default_font, true);

	var _mapstring = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789,.-;:_+-*/\\'\"!?~^°<>|(){[]}%&=#@$ÄÖÜäöüß";
	scribble_add_spritefont( "spr_tby_font_main", _mapstring + "«»", 0, 3); 
	scribble_add_spritefont("spr_tby_font_small", "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,-;:_+-*/|#[]", 0, 2);

	scribble_add_colour("c_thought", $78d7ff);

	scribble_autotype_add_event("pause", _tby_event_handle_pause);
	scribble_autotype_add_event("speed", _tby_event_handle_speed);
	scribble_autotype_add_event("wait", _tby_event_handle_wait);

	scribble_set_glyph_property("spr_tby_font_small", "T", SCRIBBLE_GLYPH.X_OFFSET, -1, true);
	scribble_set_glyph_property("spr_tby_font_small", "I", SCRIBBLE_GLYPH.X_OFFSET, -1, true);
	scribble_set_glyph_property("spr_tby_font_small", "1", SCRIBBLE_GLYPH.X_OFFSET, -1, true);
	scribble_set_glyph_property("spr_tby_font_small", "M", SCRIBBLE_GLYPH.X_OFFSET, 1, true);
	scribble_set_glyph_property("spr_tby_font_small", "W", SCRIBBLE_GLYPH.X_OFFSET, 1, true);


}
