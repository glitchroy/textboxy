/// @desc This script is used to load scribble and configure it.
scribble_init("Fonts", tby_default_font, true);

var _mapstring = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789,.-;:_+-*/\\'\"!?~^°<>|(){[]}%&=#@$ÄÖÜäöüß";
scribble_add_spritefont( "sprTbyFontMain", _mapstring + "«»", 0, 3); 
scribble_add_spritefont("sprTbyFontSmall", "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,-;:_+-*/|#[]", 0, 2);

scribble_add_colour("c_thought", $78d7ff);

scribble_autotype_add_event("pause", tby_event_handle_pause);
scribble_autotype_add_event("speed", tby_event_handle_speed);
scribble_autotype_add_event("wait", tby_event_handle_wait);

scribble_set_glyph_property("sprTbyFontSmall", "T", SCRIBBLE_GLYPH.X_OFFSET, -1, true);
scribble_set_glyph_property("sprTbyFontSmall", "I", SCRIBBLE_GLYPH.X_OFFSET, -1, true);
scribble_set_glyph_property("sprTbyFontSmall", "1", SCRIBBLE_GLYPH.X_OFFSET, -1, true);
scribble_set_glyph_property("sprTbyFontSmall", "M", SCRIBBLE_GLYPH.X_OFFSET, 1, true);
scribble_set_glyph_property("sprTbyFontSmall", "W", SCRIBBLE_GLYPH.X_OFFSET, 1, true);