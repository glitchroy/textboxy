function tby_debug_draw(_x, _y, _text, _max_width, _color) {
    var _mw = tby_undefined_safe(_max_width, -1);
    var _c  = tby_undefined_safe(_color, c_white);
    
    draw_set_font(font_tby_debug);
    draw_set_color(c_black);
    draw_set_alpha(0.5);
    draw_rectangle(_x-1, _y,
                   _x+string_width_ext(_text, -1, _mw),
                   _y+string_height_ext(_text, -1, _mw)-1,
                   false);
    draw_set_alpha(1);
    
    draw_set_color(c_black);
    draw_text_ext(_x+1, _y+1, _text, -1, _mw);
    
    draw_set_color(_c);
    draw_text_ext(_x, _y, _text, -1, _mw);
};