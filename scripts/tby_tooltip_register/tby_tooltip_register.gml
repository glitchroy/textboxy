/// @param tooltipName
/// @param text
/// @param maxWidth
/// @param showBubbleSprite
var tooltipName = argument0, text = argument1, maxWidth = argument2, showBubbleSprite = argument3;

// Register new branch to global map

tby_log("Creating TbyTooltip \"" + tooltipName + "\".")

var tooltipPayload = [];
var scribble = scribble_create(text, -1, maxWidth, tby_default_color, tby_default_font);

// Overwrite typewriter smoothness to avoid
// the first character being drawn transparent
scribble[| __SCRIBBLE.TW_SMOOTHNESS] = 0;

tooltipPayload[TbyTooltip.Text] = scribble
tooltipPayload[TbyTooltip.DrawBubbleSprite] = showBubbleSprite


global.tby_tooltips[? tooltipName] = tooltipPayload;