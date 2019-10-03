/// @desc Creates a new TbyBranch. Returns the named identifier or a randomly generated one.
/// @param _type
/// @param _content
/// @param _skin
/// @param _config
/// @param _placement = TbyPlacement.Auto
/// @param ?_instance = undefined
/// @param ?_choices = undefined
var _type = argument[0], _content = argument[1], _skin/*:TbySkin*/ = argument[2], _config/*:TbyConfig*/ = argument[3];
var _placement = argument_count > 4 ? argument[4] : TbyPlacement.Auto;
var _instance = argument_count > 5 ? argument[5] : undefined;
var _choices = argument_count > 6 ? argument[6] : undefined;

_content = string_replace_all(_content, "\r\n","\n");
_content = string_replace_all(_content, "\t", "");

var _inst = instance_create_layer(0, 0, tby_room_layer_name, objTbyInstance);
with (_inst) {
    type = _type;
    skin = _skin;
    content = _content;
    instance = _instance;
    choices = _choices;
    config = _config;
    
    tw_speed = tby_default_speed;
    image_speed = tby_generic_blink_speed;
    
    pause_timer = 0;
    tw_position = 0;
    
    draw_bubble_sprite = type == TbyType.Bubble;
    draw_input_circle = false;
    
    if (type == TbyType.Choice) {
        choice_selected = 0;
        choice_first_line = (content == "") ? 0 : string_count("\n", content);
    	
    	var _choice_string = (content != "") ? "\n" : "";
    	for (var i = 0; i < tby_arrlen(_choices); i++) {
    	    _choice_string += "    " + _choices[i];
    	    if (i != tby_arrlen(_choices)-1) _choice_string += "[pause,0.25]\n";
    	}
    	
    	content += _choice_string;
    }
    
    // Create scribble structure
    scribble = scribble_create(
            content,
            -1,
            type == TbyType.Bubble ? tby_bubble_max_width : tby_box_width,
            tby_default_color,
            tby_default_font,
            fa_left//,
            /*[
                _config.WaveSize,
                _config.WaveFrequency,
                _config.WaveSpeed,
                _config.ShakeSize,
                _config.ShakeSpeed,
                _config.RainbowWeight,
                _config.RainbowSpeed
            ]*/
        );
    
    //set origin point of box to topleft
    scribble_set_box_alignment(scribble); 
    scribble_typewriter_in(scribble, SCRIBBLE_TYPEWRITER_PER_CHARACTER, tw_speed, 0);

    dimensions = tby_dim_create(type, scribble, _skin[TbySkin.TileSize], _placement, instance, sprite_get_height(_skin[TbySkin.Bubble]));
}

return _inst;