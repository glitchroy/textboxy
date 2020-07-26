global.tby_pause_callbacks_list = ds_list_create();
function tby_pause_add_callback(_time, _chain_context) {
    ds_list_add(global.tby_pause_callbacks_list, { timer: _time, chain: _chain_context })
}

function tby_do_step(){
    // Chain timers
    if (ds_list_size(global.tby_pause_callbacks_list) > 0) {
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
    
    // Check for confirm input
    if (tby_input_confirm) {
        // check frames
        
        var _frames_size = ds_list_size(global.tby_frames_list);
        if (_frames_size > 0) {
            for (var id = 0; i < _frames_size; i++) {
                var _frame = global.tby_frames_list[| i];
                if (_frame.dismissable()) {
                    _frame.finish();
                }
            }
        }
    };
};