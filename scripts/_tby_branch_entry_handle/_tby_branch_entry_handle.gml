/// @desc Handles the given TbyBranch command and then calls the next entry.
/// @param {TbyBranch} _branch
/// @param _tb_data Array with textbox information
var _branch/*:TbyBranch*/ = argument0, _tb_data = argument1;

if (_tb_data == undefined) {
    _tby_branch_next(_branch);
}

var _tb_type = _tb_data[0];
var _tb_args = [];
var _has_args = false;

// Copy args if there are any
if (tby_arrlen(_tb_data) > 1) {
    _has_args = true;
    array_copy(_tb_args, 0, _tb_data, 1, tby_arrlen(_tb_data)-1);
}

#region Quick Modes
if (!_has_args && is_string(_tb_type)) {
    // just a string, imply simple text box
    // If bubble char is first char, use TbyType.Bubble
    // Otherwise, use TbyType.Box
    
    var _s = _tb_type;
    _tb_type = 0;
    _tb_args = 0;
    
    if (ord(string_char_at(_s, 1)) == tby_bubble_quick_mode_char) {
        // Bubble Mode
        _tb_type = TbyType.Bubble;
        // Strip the extra character
        _tb_args[0] = string_delete(_s, 1, 1);
    } else {
        // Normal Mode
        _tb_type = TbyType.Box;
        _tb_args[0] = _s;
    }
}

// This is the case when there is a Batch entry with
// quick modes
if (_has_args && is_string(_tb_type)) {
    var _is_bubble;
    _is_bubble = string_char_at(_tb_type, 1) == tby_bubble_quick_mode_char;

    // prepend type (= string) to args
    var _new_args = _tby_concat([_tb_type], _tb_args);
    _tb_args = 0;
    _tb_args = _new_args;
    
    // then overwrite type with new type
    _tb_type = _is_bubble ? TbyType.Bubble : TbyType.Box;
    
    
    // Delete bubble char
    if (_is_bubble) _tb_args[0] = string_delete(_tb_args[0], 1, 1);
}

#endregion

// Get the current skin
var _config/*:TbyConfig*/ = _branch[TbyBranch.config_array];

switch (_tb_type) {
    /******************************/
    case TbyType.Box:
        var _text = _tb_args[0];
        var _placement = tby_arrlen(_tb_args) > 1 ? _tb_args[1] : _config[TbyConfig.Placement];
        if (_placement == undefined) _placement = _config[TbyConfig.Placement];

        _tby_instance_create(
            TbyType.Box,
            _branch[TbyBranch.scribble_cache_group],
            _text,
            _config[TbyConfig.Skin],
            _branch[TbyBranch.config_array],
            _placement
            );
    break;
    /******************************/
    case TbyType.Bubble:
        var _text = _tb_args[0];
        var _instance = tby_arrlen(_tb_args) > 1 ? _tb_args[1] : _config[TbyConfig.Instance];
        if (_instance == noone || _instance == undefined) _instance = _config[TbyConfig.Instance];
        
        _tby_instance_create(
            TbyType.Bubble,
            _branch[TbyBranch.scribble_cache_group],
            _text,
            _config[TbyConfig.Skin],
            _branch[TbyBranch.config_array],
            undefined,
            _instance
            );
    break;
    /******************************/
    case TbyType.Choice:
        var _text = _tb_args[0];
        var _choice_array = [ _tb_args[1], _tb_args[2] ];
        var _placement = tby_arrlen(_tb_args) > 3 ? _tb_args[3] : _config[TbyConfig.Placement];
        if (_placement == undefined) _placement = _config[TbyConfig.Placement];

        _tby_instance_create(
            TbyType.Choice,
            _branch[TbyBranch.scribble_cache_group],
            _text,
            _config[TbyConfig.Skin],
            _branch[TbyBranch.config_array],
            _placement,
            undefined,
            _choice_array
            );
    break;
    /******************************/
    case TbyCmd.Config:
        var _config_name = _tb_args[0];
        var _config_value = _tb_args[1];
        
        _branch[_config_name] = _config_value;
        _tby_branch_next(_branch);
    break;
    /******************************/
    case TbyCmd.Pause:
        var _wait_seconds = _tb_args[0];

        with (tby_object_manager) {
            branch_to_continue = _branch;
            alarm[0] = room_speed*_wait_seconds;
        }
    break;
    /******************************/
    case TbyCmd.Exit:
        var _list/*:TbyList*/ = _branch[TbyBranch.message_list];
        _tby_list_clear(_list);
        _tby_branch_next(_branch);
    break;
    /******************************/
    case TbyCmd.Label:
        // Because of pre-scan, this does nothing at runtime
        _tby_branch_next(_branch);
    break;
    /******************************/
    case TbyCmd.GoTo:
        var _label_name = _tb_args[0];

        var _label_pointer = _tby_branch_label_get(_branch, _label_name);
        if (_label_pointer != undefined) {
            var _list/*:TbyList*/ = _branch[TbyBranch.message_list];
            _tby_list_set_pointer(_list, _label_pointer);
        }
        _tby_branch_next(_branch);
    break;
    /******************************/
    case TbyCmd.SetVar:
        var _calling_instance = _tb_args[0];
        var _variable_name = string(_tb_args[1]);
        var _variable_value = _tb_args[2];
        
        if (instance_exists(_calling_instance)) {
            variable_instance_set(_calling_instance, _variable_name, _variable_value);
        }
        
        _tby_branch_next(_branch);
    break;
    /******************************/
    case TbyCmd.SetGlobal:
        var _variable_name = string(_tb_args[0]);
        var _variable_value = _tb_args[1];
    
        variable_global_set(_variable_name, _variable_value);
        
        _tby_branch_next(_branch);
    break;
    /******************************/
    case TbyCmd.Conditional:
        var _conditional_key = _tb_args[0];

        var _list/*:TbyList*/ = _branch[TbyBranch.message_list];
        var _pointer = _tby_list_get_pointer(_list);
    
        var _result = _tby_branch_conditional_evaluate(_conditional_key);
        if (_result != undefined) {
            var _shallow_result = _tby_array_flatten_shallow(_result);
            _tby_branch_conditional_insert(_branch, _pointer, _shallow_result);
        }
        
        // After inserting conditional, skip this instruction
        _tby_branch_next(_branch);
    break;
    /******************************/
    case TbyCmd.Script:
        var _script_index = _tb_args[0];
        
        if (script_exists(_script_index)) {
            if (tby_arrlen(_tb_args) > 1) {
                var _args = [];
                for (var i = 1; i < tby_arrlen(_tb_args); i++) {
                    _args[@ tby_arrlen(_args)] = _tb_args[i];
                }
                _tby_spread(_script_index, _args);
            } else {
                script_execute(_script_index);
            }
        }
        
        _tby_branch_next(_branch);
    break;
}