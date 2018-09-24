if (stateName == "Init") exit;
if (text == undefined) exit;

var ghostMode = (stateName == "Inactive");

var padding = 6;
var box = scribble_get_box( text, x, y, padding, padding, padding, padding );
var s/*:TbySize*/ = array_clone(tbSize)

if (s[TbySize.width] > gameWidth) s[@TbySize.width] = box[2]-box[0]
if (s[TbySize.height] > gameHeight) s[@TbySize.height] = box[3]-box[1]

if (selectable) {
    //expand box for size of "confirmation" dot
    s[@TbySize.width] += 4;
    s[@TbySize.x] -= 2;
}

// Background
draw_set_color(c_black);
draw_rectangle( s[TbySize.x], s[TbySize.y], s[TbySize.x]+s[TbySize.width]-1, s[TbySize.y]+s[TbySize.height]-1, false);

scribble_draw(text, s[TbySize.x]+padding/2, s[TbySize.y]+padding/2);

// Finished circle
draw_set_color(c_white);
if (selectable && stateName == "Finished") draw_sprite(sprTbyConfirm, -1, s[TbySize.x]+s[TbySize.width] - 4, s[TbySize.y]+s[TbySize.height] - 4)

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


if (global.debug && (!selectable || (selectable && selected))) {
    var ds;
    ds = string(id-100000) +
	//"| Pos: " + string(position) + "/" + string(scribble_get_length(text)) +
    "| State: " + stateName + 
    "| Selectable: " + string_bool(selectable);
	scribble_basic_draw_cached("sprTbyFontSmall",
							   string_upper(ds),
							   s[TbySize.x],
							   s[TbySize.y]-10);
}