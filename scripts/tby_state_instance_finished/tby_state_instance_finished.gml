var _scribble_element = scribble_element;
var _choices          = choices;
var _type             = type;
var _instance         = instance;
var _dim/*:TbyDim*/       = dimensions;
var _skin/*:TbySkin*/     = skin;

if (state_new) {
    draw_input_circle = true;
    _scribble_element[@ __SCRIBBLE.AUTOTYPE_METHOD] = SCRIBBLE_TYPEWRITER_NONE;
}

if (tby_input_confirm) {
    if (_type == TbyType.Choice) global.tby_choice_result = choice_selected;
    tby_state_switch("Vanishing");
    
    // Callback to next textbox
    with (tby_object_manager) {
        tby_branch_next(branch);
    }
}

// Choice cursor movements
if (_type == TbyType.Choice) {
    var _choice_length = tby_arrlen(_choices)-1;
    
    if (tby_input_choice_up) {
        choice_selected--;
        if (choice_selected < 0) {
            choice_selected = _choice_length;
        }
    }
    
    if (tby_input_choice_down) {
        choice_selected++;
        if (choice_selected > _choice_length) {
            choice_selected = 0;
        }
    }
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