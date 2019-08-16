/// @param _tooltip_name
/// @param _text
/// @param _max_width
/// @param _show_bubble_sprite
var _tooltip_name = argument0, _text = argument1, _max_width = argument2, _show_bubble_sprite = argument3;

// Register new branch to global map

tby_log("Creating TbyTooltip \"" + _tooltip_name + "\".")

var _tooltip_payload = [];
var _scribble = scribble_create(_text, -1, _max_width, tby_default_color, tby_default_font);

// Overwrite typewriter smoothness to avoid
// the first character being drawn transparent
_scribble[| __SCRIBBLE.TW_SMOOTHNESS] = 0;

_tooltip_payload[TbyTooltip.Text] = _scribble
_tooltip_payload[TbyTooltip.DrawBubbleSprite] = _show_bubble_sprite


global.tby_tooltips[? _tooltip_name] = _tooltip_payload;