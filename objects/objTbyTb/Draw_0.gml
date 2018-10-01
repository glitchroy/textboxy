if (stateName == "Init") exit;
if (text == undefined) exit;

var ghostMode = (stateName == "Inactive");

var padding = tby_tile_size;
var s/*:TbySize*/ = tby_array_clone(tbSize)
var box = scribble_get_box(text, s[TbySize.x], s[TbySize.y], padding, padding, padding, padding);

if (s[TbySize.width] > tby_game_width) s[@TbySize.width] = box[2]-box[0] else s[@TbySize.width]+=padding
if (s[TbySize.height] > tby_game_height) s[@TbySize.height] = box[3]-box[1] else s[@TbySize.height]+=padding

if (selectable) {
    //expand box for size of "confirmation" dot
    s[@TbySize.width] += 4;
    s[@TbySize.x] -= 2;
}

// Background
draw_set_color(c_black);
//draw_rectangle( s.x, s.y, s.x+s.width-1, s.y+s.height-1, false);
tby_draw_box(s[TbySize.x], s[TbySize.y], s[TbySize.width]+padding, s[TbySize.height]+padding)

scribble_draw(text, s[TbySize.x]+padding, s[TbySize.y]+padding);

// Finished circle
draw_set_color(c_white);
var circleSprite = tby_array_get(tby_default_skin, TbySkin.Pause)
if (selectable && stateName == "Finished") draw_sprite(circleSprite, -1, s[TbySize.x]+s[TbySize.width]+padding, s[TbySize.y]+s[TbySize.height]+padding)

//Bubble
if (instance_exists(inst) && !sizeClamped) {
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


if (global.tbyDebug && (!selectable || (selectable && selected))) {
    var ds;
    ds = string(id-100000) +
	//"| Pos: " + string(position) + "/" + string(scribble_get_length(text)) +
    "| State: " + stateName + 
    "| Selectable: " + tby_string_bool(selectable);
	scribble_basic_draw_cached("sprTbyFontSmall",
							   string_upper(ds),
							   s[TbySize.x],
							   s[TbySize.y]-10);
}