if (stateName == "Init") exit;
if (text == undefined) exit;

var padding = tby_tile_size;
var s/*:TbySize*/ = tby_array_clone(textSize) //box of text
var box = scribble_get_box(text, s[TbySize.x], s[TbySize.y], padding, padding, padding, padding); //box of textbox

// If auto-size is input, fit the size to box dimensions
if (s[TbySize.width] > tby_game_width) s[@TbySize.width] = (box[2]-box[0])-padding*2
if (s[TbySize.height] > tby_game_height) s[@TbySize.height] = (box[3]-box[1])-padding*2

// Background
tby_draw_box(box[0], box[1], box[2], box[3]);

scribble_draw(text, s[TbySize.x]-1, s[TbySize.y]-1);

// Finished circle
var circleSprite = tby_array_get(tby_default_skin, TbySkin.Pause)
if (selectable && stateName == "Finished") draw_sprite(circleSprite, -1, s[TbySize.x]+s[TbySize.width]+padding, s[TbySize.y]+s[TbySize.height]+padding)

//Bubble
if (inst != undefined && instance_exists(inst) && !sizeClamped) {
    var bubbleSprite = tby_array_get(tby_default_skin, TbySkin.Bubble)
    tby_draw_sprite(bubbleSprite, s[TbySize.x]+s[TbySize.width]/2+padding/2, s[TbySize.y]+s[TbySize.height]+padding)
}

#region Debug
if (global.tbyDebug && (!selectable || (selectable && selected))) {
    draw_set_alpha(0.75)
    draw_set_color(c_green); draw_rectangle(box[0], box[1], box[2], box[3], true);
    draw_set_color(c_aqua);  draw_rectangle(s[TbySize.x], s[TbySize.y], s[TbySize.x]+s[TbySize.width], s[TbySize.y]+s[TbySize.height], true);
    draw_set_alpha(1)
    
    var ds;
    ds = string(id-100000) +
	//"| Pos: " + string(position) + "/" + string(scribble_get_length(text)) +
    "| State: " + stateName + 
    "| Selectable: " + tby_string_bool(selectable);
	scribble_basic_draw_cached("sprTbyFontSmall",
							   string_upper(ds),
							   box[0],
							   box[1]-padding);
}
#endregion