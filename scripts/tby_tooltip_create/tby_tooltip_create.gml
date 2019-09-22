/// @param _tooltip_name
/// @param _text
/// @param _draw_bubble_sprite = true
/// @param _max_width = tby_tooltip_max_width
/// @param _skin = tby_default_skin
var _tooltip_name = argument[0], _text = argument[1];
var _draw_bubble_sprite = argument_count > 2 ? argument[2] : true;
var _max_width = argument_count > 3 ? argument[3] : tby_tooltip_max_width;
var _skin = argument_count > 4 ? argument[4] : tby_default_skin;

// Abort if the name already exists
if (tby_tooltip_exists(_tooltip_name)) {
    tby_log("Can't create TbyTooltip \""+ _tooltip_name +"\" because it already exists.")
    exit;
}

tby_tooltip_register(_tooltip_name, _text, _max_width, _skin, _draw_bubble_sprite)


return _tooltip_name;
