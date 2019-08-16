if (state_name == "Init" || state_name == "Vanishing") exit;
if (textScribble == undefined) exit;

// Define variables to work with
var padding = tby_tile_size;
var textDim/*:TbyPos*/ = tby_array_clone(pos)
var boxDim = [textDim[TbyPos.x]-padding, textDim[TbyPos.y]-padding, textDim[TbyPos.x]+textDim[TbyPos.width]+padding, textDim[TbyPos.y]+textDim[TbyPos.height]+padding]

//scribble_get_box(textScribble, textDim.x, textDim.y, padding, padding, padding, padding)
// Background
tby_draw_box(boxDim[0], boxDim[1], boxDim[2], boxDim[3]);

scribble_draw(textScribble, textDim[TbyPos.x]-1, textDim[TbyPos.y]-1);

// Finished circle
var circleSprite = tby_array_get(tby_branch_get_option(global.tby_active_branch, TbyOption.SetSkin), TbySkin.Pause)
if (state_name == "Finished") draw_sprite(circleSprite, -1, textDim[TbyPos.x]+textDim[TbyPos.width]+padding,
                                                           textDim[TbyPos.y]+textDim[TbyPos.height]+padding)

#region Debug
if (global.tby_debug) {
    draw_set_alpha(0.75)
    draw_set_color(c_green); draw_rectangle(boxDim[0], boxDim[1], boxDim[2], boxDim[3], true); //outer
    draw_set_color(c_aqua);  draw_rectangle(textDim[TbyPos.x], textDim[TbyPos.y], textDim[TbyPos.x]+textDim[TbyPos.width], textDim[TbyPos.y]+textDim[TbyPos.height], true); //inner
    draw_set_alpha(1)

    var ds;
    ds = string(id-100000) +
	//"| Pos: " + string(position) + "/" + string(scribble_get_length(text)) +
    " | State: " + state_name +
	" | " + string(textScribble[| __SCRIBBLE.TW_SPEED]) +
	" | " + string(textScribble[| __SCRIBBLE.TW_POSITION]);
    
    tby_draw_debug(boxDim[0], boxDim[1]-padding-5, ds);
}
#endregion