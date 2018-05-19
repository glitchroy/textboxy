draw_set_font(fontDefault);
var s = 
@"Press F to talk
Press M to resize the window
Press R to restart";
draw_set_color(c_black);
draw_set_alpha(0.75);
draw_rectangle(0, 0,
			   string_width(s)+10,
			   string_height(s)+10,
			   false);
draw_set_alpha(1);

draw_set_color(c_white);
draw_text(5, 5, s);