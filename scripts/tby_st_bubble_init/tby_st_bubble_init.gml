// Init basics
typewriterPos = 0;
textSpeed = tby_default_text_speed;
smoothness = 0;
waitTimer = 0;
pos = 0;
sizeClamped = false;

// Calculate position
var tbWidth = tby_max_width_bubble;
textScribble = scribble_create(textRaw, tbWidth, tby_default_font, fa_left, tby_default_color);

var padding = tby_tile_size;
var box = scribble_get_box(textScribble, 0, 0); // just for relative width / height
pos = tby_pos_create_bubble(inst, box[2]-box[0], box[3]-box[1])

//Add camera offset
//Calc max size (the custom box width if specified or the whole game screen)
var cam = view_camera[0]
if (cam != -1) {
    var padding = tby_tile_size;
    var posi/*:TbyPos*/ = self.pos;
    posi[@TbyPos.x] = camera_get_view_x(cam) + posi[TbyPos.x] + padding;
    posi[@TbyPos.y] = camera_get_view_y(cam) + posi[TbyPos.y] + padding;
}

//message confirmation dot speed
image_speed = tby_confirmation_blink_speed;

//set origin point of box to topleft
scribble_set_box_alignment(textScribble); 

//set fade in to 0 to begin with
scribble_set_char_fade_direct(textScribble, 0, smoothness);

//Options
var shake = global.tby_current_options_map[? TbyOption.SetShake]
var wave = global.tby_current_options_map[? TbyOption.SetWave]
scribble_set_shake(textScribble, shake == undefined ? tby_default_shake_intensity : shake)
scribble_set_wave(textScribble, wave == undefined ? tby_default_wave_intensity : wave)

//Adjust position optionally
if (inst != undefined && instance_exists(inst)) {
    tby_bubble_update_position(inst);
    tby_bubble_clamp_position()
}


tby_state_switch("Writing")