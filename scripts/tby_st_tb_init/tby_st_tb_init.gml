// Init basics
typewriter_speed = SCRIBBLE_DEFAULT_TYPEWRITER_SPEED;
pause_timer = 0;
var _pos/*:TbyPos*/ = self.pos

//Add camera offset
//Calc max size (the custom box width if specified or the whole game screen)
var _cam = view_camera[0]
if (_cam != -1) {
    _pos[@TbyPos.x] += camera_get_view_x(_cam);
    _pos[@TbyPos.y] += camera_get_view_y(_cam);
}

//message confirmation dot speed
image_speed = tby_confirmation_blink_speed;

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
                               _pos[TbyPos.width],
                               tby_default_color,
                               tby_default_font,
                               fa_left,
                               _data_fields);

//set origin point of box to topleft
scribble_set_box_alignment(text_scribble); 

scribble_typewriter_in(text_scribble, SCRIBBLE_TYPEWRITER_PER_CHARACTER, typewriter_speed, 0);

tby_state_switch("Writing")