// Init basics
typewriter_speed = SCRIBBLE_DEFAULT_TYPEWRITER_SPEED;
pause_timer = 0;
//message confirmation dot speed
image_speed = tby_confirmation_blink_speed;

#region Create scribble structure
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

var _tb_width = type == TbyType.Bubble ? tby_max_width_bubble : dimensions[@TbyDim.width]
text_scribble = scribble_create(text_raw,
                               -1,
                               _tb_width,
                               tby_default_color,
                               tby_default_font,
                               fa_left,
                               _data_fields);
#endregion

#region Bubble specific setup
switch (type) {
    case TbyType.Bubble:
        size_clamped = false;
        // Calculate dimensions now when in bubble
        var _box = scribble_get_box(text_scribble, 0, 0); // just for relative width / height
        dimensions = TbyDim.bubble(instance, tby_scribble_get_box_width(_box), tby_scribble_get_box_height(_box))
        
        //Adjust position optionally
        if (instance != undefined && instance_exists(instance)) {
            tby_bubble_update_position(instance);
            tby_bubble_clamp_position()
        }
    break;
}
#endregion

#region Add camera offset
var _cam = view_camera[0]
if (_cam != -1) {
    dimensions[@TbyDim.x] += camera_get_view_x(_cam);
    dimensions[@TbyDim.y] += camera_get_view_y(_cam);
}
#endregion

//set origin point of box to topleft
scribble_set_box_alignment(text_scribble); 
scribble_typewriter_in(text_scribble, SCRIBBLE_TYPEWRITER_PER_CHARACTER, typewriter_speed, 0);

tby_state_switch("Writing")