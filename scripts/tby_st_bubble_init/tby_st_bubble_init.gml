// Init basics
text_speed = SCRIBBLE_DEFAULT_TYPEWRITER_SPEED;
wait_timer = 0;
pos = 0;
size_clamped = false;

// Calculate position
var _tb_width = tby_max_width_bubble;

var _branch_name = global.tby_active_branch;
var _data_fields = [
    tby_branch_get_option(_branch_name, TbyOption.SetWaveSize),
    tby_branch_get_option(_branch_name, TbyOption.SetWaveFrequency),
    tby_branch_get_option(_branch_name, TbyOption.SetWaveSpeed),
    tby_branch_get_option(_branch_name, TbyOption.SetShakeSize),
    tby_branch_get_option(_branch_name, TbyOption.SetShakeSpeed),
    tby_branch_get_option(_branch_name, TbyOption.SetRainbowWeight),
    tby_branch_get_option(_branch_name, TbyOption.SetRainbowSpeed)
]

text_scribble = scribble_create(text_raw,
                               -1,
                               _tb_width,
                               tby_default_color,
                               tby_default_font,
                               fa_left,
                               _data_fields);


var _padding = tby_tile_size;
var _box = scribble_get_box(text_scribble, 0, 0); // just for relative width / height
pos = tby_pos_create_bubble(inst, tby_scribble_get_box_width(_box), tby_scribble_get_box_height(_box))

//Add camera offset
//Calc max size (the custom box width if specified or the whole game screen)
var _cam = view_camera[0]
if (_cam != -1) {
    var _padding = tby_tile_size;
    var _pos/*:TbyPos*/ = self.pos;
    _pos[@TbyPos.x] = camera_get_view_x(_cam) + _pos[TbyPos.x] + _padding;
    _pos[@TbyPos.y] = camera_get_view_y(_cam) + _pos[TbyPos.y] + _padding;
}

//message confirmation dot speed
image_speed = tby_confirmation_blink_speed;

//set origin point of box to topleft
scribble_set_box_alignment(text_scribble); 

//set fade in to 0 to begin with
scribble_typewriter_in(text_scribble, SCRIBBLE_TYPEWRITER_PER_CHARACTER, text_speed, 0);

//Adjust position optionally
if (inst != undefined && instance_exists(inst)) {
    tby_bubble_update_position(inst);
    tby_bubble_clamp_position()
}


tby_state_switch("Writing")