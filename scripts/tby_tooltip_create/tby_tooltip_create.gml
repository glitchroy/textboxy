/// @param tooltipName
/// @param text
var tooltipName = argument0, text = argument1;

// Abort if the name already exists
if (tby_tooltip_exists(tooltipName)) {
    tby_log("Can't create TbyTooltip \""+ tooltipName +"\" because it already exists.")
    exit;
}

tby_tooltip_register(tooltipName, text)


return tooltipName;