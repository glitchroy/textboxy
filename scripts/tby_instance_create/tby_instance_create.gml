/// @desc Creates a new TbyBranch. Returns the named identifier or a randomly generated one.
/// @param _type
/// @param _content
/// @param _skin
/// @param _config
/// @param _placement = TbyPlacement.Auto
/// @param ?_instance = undefined
/// @param ?_choices = undefined
var _type = argument[0], _content = argument[1], _skin = argument[2], _config = argument[3];
var _placement = argument_count > 4 ? argument[4] : TbyPlacement.Auto;
var _instance = argument_count > 5 ? argument[5] : undefined;
var _choices = argument_count > 6 ? argument[6] : undefined;

var _skin/*:TbySkin*/ = _skin;
var _config/*:TbyConfig*/ = _config;

_content = string_replace_all(_content, "\r\n","\n")
_content = string_replace_all(_content, "\t", "");

var _inst = instance_create_layer(0, 0, tby_room_layer_name, objTbyInstance);
with (_inst) {
    type = _type;
    skin = _skin;
    content = _content;
    placement = _placement;
    instance = _instance;
    choices = _choices;
    config = _config;
    
    tw_speed = tby_default_speed;
    image_speed = tby_generic_blink_speed;
    
    pause_timer = 0;
    tw_position = 0;
    
    switch (type) {
        case TbyType.Choice:
        case TbyType.Box:
            dimensions = tby_box_dimensions_from_placement(
                    placement,
                    tby_box_lines_per_box,
                    skin[@ TbySkin.TileSize]
                )
        break;
    }
    
    // Create scribble structure
    scribble = scribble_create(
            content,
            -1,
            type == TbyType.Bubble ? tby_bubble_max_width : dimensions[@TbyDim.width],
            tby_default_color,
            tby_default_font,
            fa_left,
            [
                _config[TbyConfig.WaveSize],
                _config[TbyConfig.WaveFrequency],
                _config[TbyConfig.WaveSpeed],
                _config[TbyConfig.ShakeSize],
                _config[TbyConfig.ShakeSpeed],
                _config[TbyConfig.RainbowWeight],
                _config[TbyConfig.RainbowSpeed]
            ]
        )
        
    //set origin point of box to topleft
    scribble_set_box_alignment(scribble); 
    scribble_typewriter_in(scribble, SCRIBBLE_TYPEWRITER_PER_CHARACTER, tw_speed, 0);
        
    #region Bubble specific setup
    if (type == TbyType.Bubble) {
        size_clamped = false;
        // Calculate dimensions now when in bubble
        var _box = scribble_get_box(text_scribble, 0, 0); // just for relative width / height
        dimensions = tby_dim_bubble(instance, tby_scribble_get_box_width(_box), tby_scribble_get_box_height(_box))
        
        //Adjust position optionally
        if (instance != undefined && instance_exists(instance)) {
            tby_bubble_position_update(instance);
            tby_bubble_position_clamp()
        }
    }
    #endregion
    
    #region Add camera offset
    var _cam = tby_game_camera
    if (_cam != -1) {
        dimensions[@TbyDim.x] += camera_get_view_x(_cam);
        dimensions[@TbyDim.y] += camera_get_view_y(_cam);
    }
    #endregion
}

return _inst;