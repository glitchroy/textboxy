if (stateName == "Init") exit;
if (text == undefined) exit;

var ghostMode = (stateName == "Inactive");

var padding = tby_tile_size;
var s/*:TbySize*/ = tby_array_clone(textSize)
var box = scribble_get_box( text, s[TbySize.x], s[TbySize.y], padding, padding, padding, padding );

if (s[TbySize.width] > tby_game_width) s[@TbySize.width] = box[2]-box[0] else s[@TbySize.width]+=padding
if (s[TbySize.height] > tby_game_height) s[@TbySize.height] = box[3]-box[1] else s[@TbySize.height]+=padding

// Background
draw_set_color(c_black);
tby_draw_box(s[TbySize.x], s[TbySize.y], s[TbySize.width]+padding, s[TbySize.height]+padding)

draw_set_color(c_white);
if (stateName == "Finished") {
    choiceLine = choiceFirstLine + selectedChoice  
    
    var heightOffset = padding;
    for (var i = 0; i < choiceLine; i++) { //Todo choiceFirstLine to actual line
       heightOffset += Get(text, "lines list", i, "height")
    }

    var currentLH = Get(text, "lines list", choiceLine, "height");
    
    draw_set_color(c_gray);
    draw_set_alpha(0.2)
    //gpu_set_blendmode_ext(bm_inv_dest_color, bm_zero)
    gpu_set_blendmode_ext(bm_dest_color, bm_zero);
    draw_rectangle(s[TbySize.x], s[TbySize.y]+heightOffset+2,
                   s[TbySize.x]+s[TbySize.width]+padding-1, s[TbySize.y]+heightOffset+currentLH+2, false)
    gpu_set_blendmode_ext(bm_src_alpha, bm_inv_src_alpha)
    draw_set_alpha(1)

}

scribble_draw(text, s[TbySize.x]+padding, s[TbySize.y]+padding);

// Border
//draw_set_color(c_white);
//draw_rectangle( s.x, s.y, s.x+s.width-1, s.y+s.height-1, true );

//Bubble
if (inst != undefined && instance_exists(inst) && !sizeClamped) {
    var bubbleSprite = tby_array_get(tby_default_skin, TbySkin.Bubble)
    tby_draw_sprite(bubbleSprite, s[TbySize.x]+s[TbySize.width]/2+padding/2, s[TbySize.y]+s[TbySize.height]+padding)
}

//inactive?
if (ghostMode) {
	draw_set_color(c_black);
	draw_set_alpha(0.65);
	draw_rectangle( s[TbySize.x], s[TbySize.y], s[TbySize.x]+s[TbySize.width]+padding-1, s[TbySize.y]+s[TbySize.height]+padding-1, false );
	draw_set_alpha(1);
}


if (global.tbyDebug) {
    var ds;
    ds = string(id-100000) +
	//"| Pos: " + string(position) + "/" + string(scribble_get_length(text)) +
    "| State: " + stateName + 
    "| Choice: " + string(selectedChoice);
	scribble_basic_draw_cached("sprTbyFontSmall",
							   string_upper(ds),
							   s[TbySize.x],
							   s[TbySize.y]-10);
}