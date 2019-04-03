//Start up Scribble and load some fonts
scribble_init_start("Fonts");
scribble_init_add_spritefont( "sprTbyFontMain", 3, SCRIBBLE_DEFAULT_SPRITEFONT_MAPSTRING + "«»"); 
scribble_init_add_spritefont("sprTbyFontSmall", 2, "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,-;:_+-*/|#[]");
scribble_init_end();

scribble_add_colour( "c_thought", $78d7ff );

scribble_add_event( "wait", tby_tb_handle_wait );
scribble_add_event( "speed", tby_tb_handle_speed );
scribble_add_event( "script", tby_tb_handle_script );

scribble_set_glyph_property( "sprTbyFontSmall", "T", SCRIBBLE_GLYPH_X_OFFSET, -1, true );
scribble_set_glyph_property( "sprTbyFontSmall", "I", SCRIBBLE_GLYPH_X_OFFSET, -1, true );
scribble_set_glyph_property( "sprTbyFontSmall", "1", SCRIBBLE_GLYPH_X_OFFSET, -1, true );
scribble_set_glyph_property( "sprTbyFontSmall", "M", SCRIBBLE_GLYPH_X_OFFSET, 1, true );
scribble_set_glyph_property( "sprTbyFontSmall", "W", SCRIBBLE_GLYPH_X_OFFSET, 1, true );

//Modify the properties of some of the characters
/*
scribble_font_char_set_width(   "sprTbyFontMain", " ", 3 );
scribble_font_char_set_x_shift( "sprTbyFontMain", " ", 3 );

scribble_font_char_add_x_shift( "sprTbyFontMain", "j", -1 )

scribble_font_char_set_width(   "sprTbyFontSmall", " ", 2 );
scribble_font_char_set_x_shift( "sprTbyFontSmall", " ", 2 );

scribble_font_char_set_x_offset( "sprTbyFontSmall", "I", 1 );
scribble_font_char_set_x_offset( "sprTbyFontSmall", "T", 1 );
scribble_font_char_set_x_offset( "sprTbyFontSmall", "Y", 1 );
scribble_font_char_set_x_offset( "sprTbyFontSmall", "1", 1 );
scribble_font_char_add_x_offset( "sprTbyFontSmall", "M", 1 );
scribble_font_char_add_x_offset( "sprTbyFontSmall", "W", 1 );