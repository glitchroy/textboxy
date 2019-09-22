/// @desc This script is used to load scribble and configure it.
scribble_init_start("Fonts", "sprTbyFontMain", false);
scribble_init_add_spritefont( "sprTbyFontMain", 3, SCRIBBLE_DEFAULT_SPRITEFONT_MAPSTRING + "«»"); 
scribble_init_add_spritefont("sprTbyFontSmall", 2, "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,-;:_+-*/|#[]");
scribble_init_end();

scribble_add_colour("c_thought", $78d7ff);

scribble_add_event("pause", tby_event_handle_pause);
scribble_add_event("speed", tby_event_handle_speed);
scribble_add_event("script", tby_event_handle_script);
scribble_add_event("wait", tby_event_handle_wait);

scribble_set_glyph_property("sprTbyFontSmall", "T", SCRIBBLE_GLYPH.X_OFFSET, -1, true);
scribble_set_glyph_property("sprTbyFontSmall", "I", SCRIBBLE_GLYPH.X_OFFSET, -1, true);
scribble_set_glyph_property("sprTbyFontSmall", "1", SCRIBBLE_GLYPH.X_OFFSET, -1, true);
scribble_set_glyph_property("sprTbyFontSmall", "M", SCRIBBLE_GLYPH.X_OFFSET, 1, true);
scribble_set_glyph_property("sprTbyFontSmall", "W", SCRIBBLE_GLYPH.X_OFFSET, 1, true);