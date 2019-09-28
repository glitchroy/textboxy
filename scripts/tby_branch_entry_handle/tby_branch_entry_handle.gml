/// @desc Handles the given TbyBranch command and then calls the next entry.
/// @param _branch
/// @param _tb_data Array with textbox information
var _branch = argument0, _tb_data = argument1;

var _b/*:TbyBranch*/ = _branch;

if (_tb_data == undefined) {
    tby_branch_next(_b)
}

var _tb_type = _tb_data[0];
var _tb_args = [];
var _has_args = false;

// Copy args if there are any
if (tby_arrlen(_tb_data) > 1) {
    _has_args = true;
    array_copy(_tb_args, 0, _tb_data, 1, tby_arrlen(_tb_data)-1)
}

#region Quick Modes
if (!_has_args && is_string(_tb_type)) {
    // just a string, imply simple text box
    // If bubble char is first char, use TbyType.Bubble
    // Otherwise, use TbyType.Box
    
    var _s = _tb_type;
    _tb_type = 0;
    _tb_args = 0;
    
    if (string_char_at(_s, 1) == tby_bubble_quick_mode_char) {
        // Bubble Mode
        _tb_type = TbyType.Bubble
        // Strip the extra character
        _tb_args[0] = string_delete(_s, 1, 1)
    } else {
        // Normal Mode
        _tb_type = TbyType.Box
        _tb_args[0] = _s
    }
}

// This is the case when there is a Batch entry with
// quick modes
if (_has_args && is_string(_tb_type)) {
    var _is_bubble;
    _is_bubble = string_char_at(_tb_type, 1) == tby_bubble_quick_mode_char

    // prepend type (= string) to args
    var _new_args = tby_concat([_tb_type], _tb_args);
    _tb_args = 0;
    _tb_args = _new_args;
    
    // then overwrite type with new type
    _tb_type = _is_bubble ? TbyType.Bubble : TbyType.Box;
    
    
    // Delete bubble char
    if (_is_bubble) _tb_args[0] = string_delete(_tb_args[0], 1, 1)
}

#endregion

// Get the current skin
var _current_skin = tby_branch_config_get(_b, TbyConfig.Skin)

switch (_tb_type) {
    /******************************/
    case TbyType.Box:
        var _text = _tb_args[0];
        var _placement = tby_arrlen(_tb_args) > 1 ? _tb_args[1] : tby_branch_config_get(_b, TbyConfig.Placement);
        if (_placement == undefined) tby_branch_config_get(_b, TbyConfig.Placement);

        tby_box_create(_b, _current_skin, _text, _placement);
    break;
    /******************************/
    case TbyType.Bubble:
        var _text = _tb_args[0];
        var _instance = tby_arrlen(_tb_args) > 1 ? _tb_args[1] : tby_branch_config_get(_b, TbyConfig.Instance);
        if (_instance == noone) tby_branch_config_get(_b, TbyConfig.Instance);
        
        // check if its a string thats an object type (from json usually)
        if (is_string(_instance)) {
            var _object_id = asset_get_index(_instance);
            if (_object_id != -1)_instance = _object_id
        } else if (_instance == undefined || !instance_exists(_instance)) {
            // sanity check
            tby_log("No valid instance specified for bubble textbox, using ", id, "as substitute.")
            _instance = id //just use the calling instance
        }
        
        tby_bubble_create(_b, _current_skin, _text, _instance)
    break;
    /******************************/
    case TbyType.Choice:
        var _text = _tb_args[0];
        var _choice_array = [ _tb_args[1], _tb_args[2] ]
        var _placement = tby_arrlen(_tb_args) > 3 ? _tb_args[3] : tby_branch_config_get(_b, TbyConfig.Instance);
        if (_placement == undefined) tby_branch_config_get(_b, TbyConfig.Placement);

        tby_choice_create(_b, _current_skin, _text, _choice_array, _placement);
    break;
    /******************************/
    case TbyCmd.Config:
        var _config_name = _tb_args[0];
        var _config_value = _tb_args[1];

        tby_branch_config_set(_b, _config_name, _config_value)
        tby_branch_next(_b)
    break;
    /******************************/
    case TbyCmd.Pause:
        var _wait_seconds = _tb_args[0];

        with (tby_object_manager) {
            branch_to_continue = _b;
            alarm[0] = room_speed*_wait_seconds;
        }
    break;
    /******************************/
    case TbyCmd.Exit:
        var _list/*:TbyList*/ = _b[TbyBranch.message_list];
        tby_list_clear(_list);
        tby_branch_next(_b);
    break;
    /******************************/
    case TbyCmd.Label:
        // Because of pre-scan, this does nothing at runtime
        tby_branch_next(_b);
    break;
    /******************************/
    case TbyCmd.GoTo:
        var _label_name = _tb_args[0];

        var _label_pointer = tby_branch_label_get(_b, _label_name)
        if (_label_pointer != undefined) {
            var _list/*:TbyList*/ = _b[TbyBranch.message_list];
            tby_list_set_pointer(_list, _label_pointer);
        }
        tby_branch_next(_b);
    break;
    /******************************/
    case TbyCmd.SetVar:
        var _calling_instance = _tb_args[0];
        var _variable_name = string(_tb_args[1]);
        var _variable_value = _tb_args[2];
        
        if (instance_exists(_calling_instance)) {
            variable_instance_set(_calling_instance, _variable_name, _variable_value)
        }
    break;
    /******************************/
    case TbyCmd.SetGlobal:
        var _variable_name = string(_tb_args[0]);
        var _variable_value = _tb_args[1];
    
        variable_global_set(_variable_name, _variable_value)
    break;
    /******************************/
    case TbyCmd.Conditional:
        var _conditional_key = _tb_args[0];

        var _list/*:TbyList*/ = _b[TbyBranch.message_list];
        var _pointer = tby_list_get_pointer(_list);
    
        var _result = tby_branch_conditional_evaluate(_conditional_key)
        if (_result != undefined) {
            var _shallow_result = tby_array_flatten_shallow(_result)
            tby_branch_conditional_insert(_b, _pointer, _shallow_result);
        }
        
        // After inserting conditional, skip this instruction
        tby_branch_next(_b)
    break;
}