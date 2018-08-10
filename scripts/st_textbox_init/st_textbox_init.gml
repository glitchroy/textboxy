// Init basics
position = 0;
textSpeed = 1;
smoothness = 0;
selected = selectable ? false : undefined;
waitTimer = 0;
var size/*:TBSize*/ = tbSize

//Calc max size (the custom box width if specified or the whole game screen)
var maxWidth = size[TBSize.width];

//message confirmation dot speed
image_speed = 1/20;

text = scribble_create(textRaw, maxWidth, "sprFontMain");

//set origin point of box to middle
scribble_set_box_alignment(text); 

//set fade in to 0 to begin with
scribble_set_char_fade_direct(text, 0, smoothness);

//Defaults
scribble_set_shake(text, 1.2)
scribble_set_wave(text, 2)

if (queue == undefined) {
    //Execute immediately
    state_switch("Writing")
} else {
    state_switch("QueuedUp")
}