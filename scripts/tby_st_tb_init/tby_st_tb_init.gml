// Init basics
position = 0;
textSpeed = tby_default_text_speed;
smoothness = 0;
selected = selectable ? /*false*/true : undefined;
waitTimer = 0;
var size/*:TbySize*/ = tbSize

//Calc max size (the custom box width if specified or the whole game screen)
maxWidth = size[TbySize.width];

//message confirmation dot speed
image_speed = tby_confirmation_blink_speed;

text = scribble_create(textRaw, maxWidth, tby_default_font, fa_left, tby_default_color);

//set origin point of box to middle
scribble_set_box_alignment(text); 

//set fade in to 0 to begin with
scribble_set_char_fade_direct(text, 0, smoothness);

//Defaults
scribble_set_shake(text, global.tbyCurrentOptionsMap[? TbyOption.SetShake])
scribble_set_wave(text, global.tbyCurrentOptionsMap[? TbyOption.SetWave])

tby_state_switch("Writing")