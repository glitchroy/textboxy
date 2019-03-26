/// @param tooltipName
/// @param tx
/// @param ty
var tooltipName = argument0, tx = argument1, ty = argument2;

with (tby_object_manager) {
    drawTooltip = true;
    tooltipProperties = [tooltipName, tx, ty];
}