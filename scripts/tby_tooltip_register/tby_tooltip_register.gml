/// @param tooltipName
/// @param text
var tooltipName = argument0, text = argument1;

// Register new branch to global map

tby_log("Creating TbyTooltip \"" + tooltipName + "\".")

var tooltipPayload = [];
tooltipPayload[TbyTooltip.Text] = scribble_create(text, -1, tby_max_width_bubble, tby_default_color, tby_default_font)

global.tby_tooltips[? tooltipName] = tooltipPayload;