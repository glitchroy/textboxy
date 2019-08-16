event_inherited();

if (state_name == "Init" || state_name == "Vanishing") exit;
if (text_scribble == undefined) exit;

var _padding = tby_tile_size;
var _text_dim/*:TbyPos*/ = tby_array_clone(pos)
var _box_dim = [_text_dim[TbyPos.x]-_padding, _text_dim[TbyPos.y]-_padding, _text_dim[TbyPos.x]+_text_dim[TbyPos.width]+_padding, _text_dim[TbyPos.y]+_text_dim[TbyPos.height]+_padding]

//Bubble
if (inst != undefined && instance_exists(inst) && !size_clamped) {
    var _bubble_sprite = tby_array_get(tby_branch_get_option(global.tby_active_branch, TbyOption.SetSkin), TbySkin.Bubble)
    tby_draw_sprite(_bubble_sprite, _box_dim[0]+(_box_dim[2]-_box_dim[0])/2, _text_dim[TbyPos.y]+_text_dim[TbyPos.height]+_padding)
}