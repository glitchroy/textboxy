// Init basics
position = 0;
textSpeed = tbyDefaultTextSpeed;
smoothness = 0;
selected = selectable ? /*false*/true : undefined;
waitTimer = 0;
var size/*:TbySize*/ = tbSize

//Calc max size (the custom box width if specified or the whole game screen)
maxWidth = size[TbySize.width];

//message confirmation dot speed
image_speed = tbyConfirmationBlinkSpeed;

text = scribble_create(textRaw, maxWidth, tbyDefaultFont);

//set origin point of box to middle
scribble_set_box_alignment(text); 

//set fade in to 0 to begin with
scribble_set_char_fade_direct(text, 0, smoothness);

//Defaults
scribble_set_shake(text, tbyDefaultShakeIntensity)
scribble_set_wave(text, tbyDefaultWaveIntensity)

state_switch("Writing")