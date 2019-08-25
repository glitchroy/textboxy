/// @desc Creates a new TbyTooltip. Returns the named indentifier.
/// @param _tooltip_name
/// @param text
/// @param _max_width = tby_tooltip_max_width
/// @param _draw_bubble_sprite = true
var _tooltip_name = argument[0], text = argument[1];
var _max_width = argument_count > 2 ? argument[2] : tby_tooltip_max_width;
var _draw_bubble_sprite = argument_count > 3 ? argument[3] : true;

// Abort if the name already exists
if (tby_tooltip_exists(_tooltip_name)) {
    tby_log("Can't create TbyTooltip \""+ _tooltip_name +"\" because it already exists.")
    exit;
}

tby_tooltip_register(_tooltip_name, text, _max_width, _draw_bubble_sprite)


return _tooltip_name;