/// @desc Creates a new TbyTooltip. Returns the named indentifier.
/// @param tooltipName
/// @param text
/// @param maxWidth = tby_max_width_tooltip
/// @param drawBubbleSprite = true
var tooltipName = argument[0], text = argument[1];
var maxWidth = argument_count > 2 ? argument[2] : tby_max_width_tooltip;
var drawBubbleSprite = argument_count > 3 ? argument[3] : true;

// Abort if the name already exists
if (tby_tooltip_exists(tooltipName)) {
    tby_log("Can't create TbyTooltip \""+ tooltipName +"\" because it already exists.")
    exit;
}

tby_tooltip_register(tooltipName, text, maxWidth, drawBubbleSprite)


return tooltipName;