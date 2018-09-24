if (stateName == "Init") exit;
if (text == undefined) exit;

var ghostMode = (stateName == "Inactive");

var padding = 6;
var box = scribble_get_box( text, x, y, padding, padding, padding, padding );
var s/*:TbySize*/ = array_clone(tbSize)

if (s[TbySize.width] > gameWidth) s[@TbySize.width] = box[2]-box[0]
if (s[TbySize.height] > gameHeight) s[@TbySize.height] = box[3]-box[1]

// Background
draw_set_color(c_black);
draw_rectangle( s[TbySize.x], s[TbySize.y], s[TbySize.x]+s[TbySize.width]-1, s[TbySize.y]+s[TbySize.height]-1, false);

scribble_draw(text, s[TbySize.x]+padding/2, s[TbySize.y]+padding/2);

// Finished circle
draw_set_color(c_white);
if (stateName == "Finished") {
    //draw_sprite(sprTbConfirm, -1, s.x+s.width - 4, s.y+s.height - 4)
    draw_set_color(c_white);
    
    choiceLine = choiceFirstLine + selectedChoice  
    
    var heightOffset = padding;
    for (var i = 0; i < choiceLine; i++) { //Todo choiceFirstLine to actual line
       heightOffset += Get(text, "lines list", i, "height")
    }

    var currentLH = Get(text, "lines list", choiceLine, "height");
    
    gpu_set_blendmode_ext(bm_inv_dest_color, bm_zero)
    draw_rectangle(s[TbySize.x], s[TbySize.y]+heightOffset-1,
                   s[TbySize.x]+s[TbySize.width]-1, s[TbySize.y]+heightOffset+currentLH-2, false)
    gpu_set_blendmode_ext(bm_src_alpha, bm_inv_src_alpha)

}

// Border
draw_set_color(c_white);
draw_rectangle( s[TbySize.x], s[TbySize.y], s[TbySize.x]+s[TbySize.width]-1, s[TbySize.y]+s[TbySize.height]-1, true );

//inactive?
if (ghostMode) {
	draw_set_color(c_black);
	draw_set_alpha(0.65);
	draw_rectangle( s[TbySize.x], s[TbySize.y], s[TbySize.x]+s[TbySize.width]-1, s[TbySize.y]+s[TbySize.height]-1, false );
	draw_set_alpha(1);
}


if (global.debug) {
    var ds;
    ds = string(id-100000) +
	//"| Pos: " + string(position) + "/" + string(scribble_get_length(text)) +
    "| State: " + stateName + 
    "| Choice: " + string(selectedChoice);
	scribble_basic_draw_cached("sprFontSmall",
							   string_upper(ds),
							   s[TbySize.x],
							   s[TbySize.y]-10);
}