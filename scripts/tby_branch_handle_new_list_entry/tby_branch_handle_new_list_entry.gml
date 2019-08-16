/// @desc Handles the given TbyBranch command and then calls the next entry.
/// @param _branch_name
/// @param _tb_data
var _branch_name = argument0, _tb_data = argument1;

var _tb_type = _tb_data[0];
var _tb_args = [];
var _has_args = false;

// Copy args if there are any
if (tby_arrlen(_tb_data) > 1) {
    _has_args = true;
    array_copy(_tb_args, 0, _tb_data, 1, tby_arrlen(_tb_data)-1)
}

#region ChoiceResult
// first, check for ChoiceResult. Since there can be a nested
// TbyType action, just unfold it
if (_tb_type == TbyType.ChoiceResult) {
    if (_has_args && _tb_args[0] == global.tby_choice_result) {
        //0: Choice num to match
        //1: New type (or quick mode string etc.)
        //2: ... usual payload
        
        var _new_type = _tb_args[1];
        
        if (tby_arrlen(_tb_args) > 2) {
            // we have actual args and not only
            // Type.ChoiceResult + Result number + "type"
            
            var _new_args = [];
            array_copy(_new_args, 0, _tb_args, 2, tby_arrlen(_tb_args)-1);
            
            _tb_args = 0;
            _tb_args = _new_args;
        } else {
            // We dont have any further args, probably quick mode
            _tb_args = [];
            _has_args = false;
        }
        
        _tb_type = _new_type;
    } else {
        // skip this entry
        tby_branch_next_entry(_branch_name)
    }
}
#endregion

#region Quick Modes
if (!_has_args && is_string(_tb_type)) {
    // just a string, imply simple text box
    // If bubble char is first char, use TbyType.Bubble
    // Otherwise, use TbyType.Normal
    
    var _s = _tb_type;
    _tb_type = 0;
    _tb_args = 0;
    
    if (string_char_at(_s, 1) == tby_quick_mode_bubble_char) {
        // Bubble Mode
        _tb_type = TbyType.Bubble
        // Strip the extra character
        _tb_args[0] = string_delete(_s, 1, 1)
    } else {
        // Normal Mode
        _tb_type = TbyType.Normal
        _tb_args[0] = _s
    }
}

// This is the case when there is a Batch entry with
// quick modes
if (_has_args && is_string(_tb_type)) {
    var _is_bubble;
    _is_bubble = string_char_at(_tb_type, 1) == tby_quick_mode_bubble_char

    // prepend type (= string) to args
    var _new_args = tby_concat([_tb_type], _tb_args);
    _tb_args = 0;
    _tb_args = _new_args;
    
    // then overwrite type with new type
    _tb_type = _is_bubble ? TbyType.Bubble : TbyType.Normal;
    
    
    // Delete bubble char
    if (_is_bubble) _tb_args[0] = string_delete(_tb_args[0], 1, 1)
}

#endregion

switch (_tb_type) {
    case TbyType.Normal:
        // 0: string
        // 1: positional data
        
        // global position data if none given
        if (tby_arrlen(_tb_args) < 2) _tb_args[1] = tby_branch_get_option(_branch_name, TbyOption.SetPlacement)
        
        tby_normal_create(_tb_args[0], _tb_args[1]);
    break;
    case TbyType.Bubble:
        // 0: string
        // 1: instance talking
        
        //use global instance if none is given
        if (tby_arrlen(_tb_args) < 2) _tb_args[1] = tby_branch_get_option(_branch_name, TbyOption.SetInstance)
        
        // check if its a string thats an object type (from json usually)
        if (is_string(_tb_args[1])) {
            var _object_id = asset_get_index(_tb_args[1]);
            if (_object_id != -1) _tb_args[1] = _object_id
        } else if (_tb_args[1] == undefined || !instance_exists(_tb_args[1])) {
            // sanity check
            tby_log("No valid instance specified for bubble textbox, using ", id, "as substitute.")
            _tb_args[1] = id //just use the calling instance
        }
        
        tby_bubble_create(_tb_args[0], _tb_args[1])
    break;
    case TbyType.Choice:
        // 0: string
        // 1: choiceArray
        // 2: positional data
        if (tby_arrlen(_tb_args) < 3) _tb_args[2] = TbyPlacement.Auto;
        tby_choice_create(_tb_args[0], _tb_args[1], _tb_args[2]);
    break;
    case TbyType.Option:
        // 0: Option type
        // 1: Option value
        tby_branch_set_option(_branch_name, _tb_args[0], _tb_args[1])
        tby_branch_next_entry(_branch_name)
    break;
    case TbyType.Wait:
        // wait time
        with (tby_object_manager) alarm[0] = room_speed*_tb_args[0]
    break;
    case TbyType.Batch:
        // 0: array of other textboxes
        if (is_array(_tb_args[0])) {
            tby_handle_batch_entry(_tb_args[0]);
        }
    break;
    case TbyType.Terminate:
        var _list = tby_branch_get_message_list(_branch_name);
        tby_list_clear(_list);
        tby_branch_next_entry(_branch_name);
    break;
    case TbyType.Label:
        // 0: label name
        // Because of pre-scan, this does nothing at runtime
        tby_branch_next_entry(_branch_name);
    break;
    case TbyType.GoTo:
        // 0: label name
        var _label_pointer = tby_branch_get_label(_branch_name, _tb_args[0])
        if (_label_pointer != undefined) {
            var _list = tby_branch_get_message_list(_branch_name);
            tby_list_set_pointer(_list, _label_pointer);
        }
        tby_branch_next_entry(_branch_name);
    break;
}