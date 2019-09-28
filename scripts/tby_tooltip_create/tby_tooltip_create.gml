/// @param _text
/// @param _draw_bubble_sprite = true
/// @param _max_width = tby_tooltip_max_width
/// @param _skin = tby_default_skin
var _text = argument[0];
var _draw_bubble_sprite = argument_count > 1 ? argument[1] : true;
var _max_width = argument_count > 2 ? argument[2] : tby_tooltip_max_width;
var _skin = argument_count > 3 ? argument[3] : tby_default_skin;

tby_log("Creating TbyTooltip...")

var _scribble = scribble_create(_text, -1, _max_width, tby_default_color, tby_default_font);
// Overwrite typewriter smoothness to avoid
// the first character being drawn transparent
_scribble[| __SCRIBBLE.TW_SMOOTHNESS] = 0;

var _t/*:TbyTooltip*/ = array_create(TbyTooltip.sizeof);

_t[@TbyTooltip.text] = _scribble;
_t[@TbyTooltip.skin] = _skin;
_t[@TbyTooltip.draw_bubble_sprite] = _draw_bubble_sprite

return _t;
