if (stateName == "Init") exit;
if (text == undefined) exit;
var ghostMode = false;
if (stateName == "QueuedUp") {
    if (!global.debug) exit;
    ghostMode = true;
}
if (stateName == "Inactive") ghostMode = true;
var padding = 6;

var box = scribble_get_box( text, x, y, padding, padding, padding, padding );
var s/*:TBSize*/ = array_clone(tbSize)

if (s[TBSize.width] > gameWidth) s[@TBSize.width] = box[2]-box[0]
if (s[TBSize.height] > gameHeight) s[@TBSize.height] = box[3]-box[1]

if (selectable) {
    //expand box for size of "confirmation" dot
    s[@TBSize.width] += 4;
    s[@TBSize.x] -= 2;
}
// Background
draw_set_color(c_black);
draw_rectangle( s[TBSize.x], s[TBSize.y], s[TBSize.x]+s[TBSize.width]-1, s[TBSize.y]+s[TBSize.height]-1, false);

scribble_draw(text, s[TBSize.x]+padding/2, s[TBSize.y]+padding/2);

// Finished circle
draw_set_color(c_white);
if (selectable && stateName == "Finished") draw_sprite(sprTbConfirm, -1, s[TBSize.x]+s[TBSize.width] - 4, s[TBSize.y]+s[TBSize.height] - 4)

// Border
draw_set_color(c_white);
draw_rectangle( s[TBSize.x], s[TBSize.y], s[TBSize.x]+s[TBSize.width]-1, s[TBSize.y]+s[TBSize.height]-1, true );

//inactive?
if (ghostMode) {
	draw_set_color(c_black);
	draw_set_alpha(0.65);
	draw_rectangle( s[TBSize.x], s[TBSize.y], s[TBSize.x]+s[TBSize.width]-1, s[TBSize.y]+s[TBSize.height]-1, false );
	draw_set_alpha(1);
}


if (global.debug && (!selectable || (selectable && selected))) {
    var ds;
    ds = string(id-100000) +
	//"| Pos: " + string(position) + "/" + string(scribble_get_length(text)) +
    "| State: " + stateName + 
    "| Selectable: " + string_bool(selectable);
	scribble_basic_draw_cached("sprFontSmall",
							   string_upper(ds),
							   s[TBSize.x],
							   s[TBSize.y]-10);
}