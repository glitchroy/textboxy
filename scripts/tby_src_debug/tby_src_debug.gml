function tby_debug_draw(_x, _y, _text, _max_width, _color) {
    var _mw = tby_nc_set(_max_width) ? tby_nc_val : -1;
    var _c  = tby_nc_set(_color) ? tby_nc_val : c_white;
    
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

function tby_log() {
	var _s = "";

	for (var i = 0; i < argument_count; i++) {
		_s += string(argument[i]) + " | ";
	}

	show_debug_message("[TBY " + string(current_time) + "] " + _s);
};

function tby_error() {
	var _s = "";

	for (var i = 0; i < argument_count; i++) {
		_s += string(argument[i]) + "\n";
	}

	show_message(_s);
};