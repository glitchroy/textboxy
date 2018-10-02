// Init basics
position = 0;
textSpeed = tby_default_text_speed;
smoothness = 0;
selected = selectable ? /*false*/true : undefined;
waitTimer = 0;
inst = global.tbyCurrentOptionsMap[? TbyOption.SetInstance]
var size/*:TbySize*/ = textSize
sizeClamped = false;

//Calc max size (the custom box width if specified or the whole game screen)
maxWidth = size[TbySize.width];

//message confirmation dot speed
image_speed = tby_confirmation_blink_speed;

text = scribble_create(textRaw, maxWidth, tby_default_font, fa_left, tby_default_color);

//set origin point of box to topleft
scribble_set_box_alignment(text); 

//set fade in to 0 to begin with
scribble_set_char_fade_direct(text, 0, smoothness);

//Options
var shake = global.tbyCurrentOptionsMap[? TbyOption.SetShake]
var wave = global.tbyCurrentOptionsMap[? TbyOption.SetWave]
scribble_set_shake(text, shake == undefined ? tby_default_shake_intensity : shake)
scribble_set_wave(text, wave == undefined ? tby_default_wave_intensity : wave)

//Adjust position optionally
if (inst != undefined && instance_exists(inst)) {
    tby_tb_update_position(inst);
    tby_tb_clamp_position()
}


tby_state_switch("Writing")