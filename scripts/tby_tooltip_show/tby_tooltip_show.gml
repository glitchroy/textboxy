/// @desc Draws a TbyTooltip this step.
/// @param _tooltip
/// @param _tx
/// @param _ty
var _tooltip = argument0, _tx = argument1, _ty = argument2;

with (tby_object_manager) {
    if (is_array(tooltips) == false) tooltips = [];
    tooltips[@ tby_arrlen(tooltips)] = [_tooltip, _tx, _ty]
    
}