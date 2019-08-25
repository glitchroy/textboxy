// Init basics
typewriter_speed = SCRIBBLE_DEFAULT_TYPEWRITER_SPEED;
pause_timer = 0;
//message confirmation dot speed
image_speed = tby_generic_blink_speed;

#region Create scribble structure
var _data_fields = [
    tby_branch_config_get(branch, TbyConfig.WaveSize),
    tby_branch_config_get(branch, TbyConfig.WaveFrequency),
    tby_branch_config_get(branch, TbyConfig.WaveSpeed),
    tby_branch_config_get(branch, TbyConfig.ShakeSize),
    tby_branch_config_get(branch, TbyConfig.ShakeSpeed),
    tby_branch_config_get(branch, TbyConfig.RainbowWeight),
    tby_branch_config_get(branch, TbyConfig.RainbowSpeed)
]

var _tb_width = type == TbyType.Bubble ? tby_bubble_max_width : dimensions[@TbyDim.width]
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
        dimensions = tby_dim_bubble(instance, tby_scribble_get_box_width(_box), tby_scribble_get_box_height(_box))
        
        //Adjust position optionally
        if (instance != undefined && instance_exists(instance)) {
            tby_bubble_position_update(instance);
            tby_bubble_position_clamp()
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