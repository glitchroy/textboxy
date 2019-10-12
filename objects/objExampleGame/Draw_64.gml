// Draws the info boxes
tby_draw_debug(0, 0, debug_string);

var _ver_x = tby_game_width;
_ver_x -= string_width("v" + tby_version);
tby_draw_debug(_ver_x, 0, "v" + tby_version, -1, c_orange);
_ver_x -= string_width(version_string) + 2;
tby_draw_debug(_ver_x, 0, version_string);

if (global.tby_debug) {
    tby_draw_debug(0, string_height(debug_string), "DEBUG MODE ON");
}