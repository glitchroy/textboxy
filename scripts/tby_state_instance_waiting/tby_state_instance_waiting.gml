var _scribble_element = scribble_element;
var _type             = type;
var _tw_speed         = tw_speed;
var _instance         = instance;
var _dim/*:TbyDim*/       = dimensions;
var _skin/*:TbySkin*/     = skin;

if (state_new) {
	tby_scribble_autotype_set_speed(_scribble_element, 0.0);
	draw_input_circle = true;
}

if (tby_input_confirm) {
	tby_scribble_autotype_set_speed(_tw_speed, 0.0);
	draw_input_circle = false;
    tby_state_switch_previous();
}

// Update instance position in Bubble
if (_type == TbyType.Bubble) {
    if (_instance != undefined && instance_exists(_instance)) {
    	if (_instance.xprevious != _instance.x ||_instance.yprevious != _instance.y) {
	    	tby_dim_position_update(_dim, _instance, sprite_get_height(_skin[TbySkin.Bubble]));
	    	tby_dim_position_clamp(_dim, 0, 0, tby_game_width, tby_game_height);
    	}
    }
}