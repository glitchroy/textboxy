function tby_pause_register(_time, _chain_context) {
    ds_list_add(global.tby_pause_callbacks_list, { timer: _time, chain: _chain_context })
}

function tby_frame_register(_frame_context) {
    ds_list_add(global.tby_frames_list, _frame_context);
}
function tby_frame_remove(_frame_context) {
    var _index = ds_list_find_index(global.tby_frames_list, _frame_context);
    ds_list_delete(global.tby_frames_list, _index);
}
function tby_frame_get() {
    return global.tby_frames_list;
}

function tby_do_step() {
    global.tby_blink_timer += tby_confirm_blink_speed;
    if (global.tby_blink_timer >= 2) global.tby_blink_timer = 0;
    
    // Tick all open timers & execute advance if neccessary
    var static advance_chain_timers = function() {
        var i = 0;
        while (i < ds_list_size(global.tby_pause_callbacks_list)) {
            var cb_object = global.tby_pause_callbacks_list[| i];
            
            if (cb_object.timer == 0) {
                cb_object.chain._advance();
                ds_list_delete(global.tby_pause_callbacks_list, i);
                // don't advance because entries shift
            } else {
                cb_object.timer--;
                i++;
            }
        }
    }
    
    // Finish every frame that is dismissable
    var static check_input_confirm = function() {
        var _frames_size = ds_list_size(global.tby_frames_list);
        if (_frames_size > 0) {
            for (var i = 0; i < _frames_size; i++) {
                var _frame = global.tby_frames_list[| i];
                if (_frame.dismissable()) {
                    _frame.finish();
                }
            }
        }
    }
    
    // Chain timers
    if (ds_list_size(global.tby_pause_callbacks_list) > 0) advance_chain_timers();
    if (tby_input_confirm) check_input_confirm();
};