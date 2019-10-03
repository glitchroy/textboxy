draw_self();

// Draws the info boxes

tby_draw_debug(0, 0, debug_string);

var _ver_width = string_width(version_string);
tby_draw_debug(tby_game_width - _ver_width, 0, version_string);

if (global.tby_debug) {
	tby_draw_debug(0, string_height(debug_string), "DEBUG MODE ON");
}