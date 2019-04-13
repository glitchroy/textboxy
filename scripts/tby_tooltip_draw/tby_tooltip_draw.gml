/// @param tooltipName
/// @param tx
/// @param ty
var tooltipName = argument0, tx = argument1, ty = argument2;

var text = tby_tooltip_get_text(tooltipName);
var box = scribble_get_box(text, 0, 0); // just for relative width / height

var tw = tby_scribble_get_box_width(box)
var th = tby_scribble_get_box_height(box)
var coordinates = tby_tooltip_calculate_offset(tx, ty, tw, th)

var padding = tby_tile_size;
var pos/*:TbyPos*/ = [coordinates[0], coordinates[1], tw, th]

var boxDim = [pos[TbyPos.x]-padding, pos[TbyPos.y]-padding, pos[TbyPos.x]+pos[TbyPos.width]+padding, pos[TbyPos.y]+pos[TbyPos.height]+padding]

tby_draw_box(boxDim[0], boxDim[1], boxDim[2], boxDim[3]);
scribble_draw(text, pos[TbyPos.x]-1, pos[TbyPos.y]-1);

//Bubble
if (tby_tooltip_get_draw_bubble_sprite(tooltipName)) {
    var bubbleSprite = tby_array_get(tby_default_skin, TbySkin.Bubble)
    tby_draw_sprite(bubbleSprite, boxDim[0]+(boxDim[2]-boxDim[0])/2, pos[TbyPos.y]+pos[TbyPos.height]+padding)
}