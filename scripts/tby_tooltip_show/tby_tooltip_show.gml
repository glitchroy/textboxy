/// @param tooltipName
/// @param tx
/// @param ty
var tooltipName = argument0, tx = argument1, ty = argument2;

with (tby_object_manager) {
    if (is_array(tooltips) == false) tooltips = [];
    tooltips[@ tby_arrlen(tooltips)] = [tooltipName, tx, ty]
    
}