//Start up Scribble and load some fonts
scribble_init_start();
scribble_init_add_spritefont("sprTbyFontMain",
                             SCRIBBLE_DEFAULT_SPRITEFONT_MAPSTRING + "«»");
scribble_init_add_spritefont("sprTbyFontSmall",
                             "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,-;:_+-*/|#[]");
scribble_init_end();

//Modify the properties of some of the characters
scribble_font_char_set_width(   "sprTbyFontMain", " ", 3 );
scribble_font_char_set_x_shift( "sprTbyFontMain", " ", 3 );
scribble_font_char_set_width(   "sprTbyFontMain", "j", 6 );
scribble_font_char_set_x_shift( "sprTbyFontMain", "j", 3 );

scribble_font_char_set_width(   "sprTbyFontSmall", " ", 2 );
scribble_font_char_set_x_shift( "sprTbyFontSmall", " ", 2 );

scribble_font_char_set_x_offset( "sprTbyFontSmall", "I", 1 );
scribble_font_char_set_x_offset( "sprTbyFontSmall", "T", 1 );
scribble_font_char_set_x_offset( "sprTbyFontSmall", "Y", 1 );
scribble_font_char_set_x_offset( "sprTbyFontSmall", "1", 1 );

scribble_font_char_add_x_offset( "sprTbyFontSmall", "W", 1 );
scribble_font_char_add_x_offset( "sprTbyFontSmall", "M", 1 );

scribble_font_char_set_width(   "sprTbyFontSmall", ",", 8 );