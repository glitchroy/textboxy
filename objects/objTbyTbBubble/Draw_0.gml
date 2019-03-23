event_inherited();

if (stateName == "Init" || stateName == "Vanishing") exit;
if (textScribble == undefined) exit;

var padding = tby_tile_size;
var textDim/*:TbyPos*/ = tby_array_clone(pos)
var boxDim = [textDim[TbyPos.x]-padding, textDim[TbyPos.y]-padding, textDim[TbyPos.x]+textDim[TbyPos.width]+padding, textDim[TbyPos.y]+textDim[TbyPos.height]+padding]

//Bubble
if (inst != undefined && instance_exists(inst) && !sizeClamped) {
    var bubbleSprite = tby_array_get(tby_branch_get_option(global.tby_active_branch, TbyOption.SetSkin), TbySkin.Bubble)
    tby_draw_sprite(bubbleSprite, boxDim[0]+(boxDim[2]-boxDim[0])/2, textDim[TbyPos.y]+textDim[TbyPos.height]+padding)
}