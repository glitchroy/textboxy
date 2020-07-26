// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function tby_do_step(){
    // Check for confirm input
    if (tby_input_confirm) {
        // check frames
        
        var _frames_size = ds_list_size(global.tby_frames_list);
        if (_frames_size > 0) {
            for (var i = 0; i < _frames_size; i++) {
                var _frame = global.tby_frames_list[| i];
                if (_frame.accepts_input()) {
                    _frame.finish();
                }
            }
        }
    }
    
    // Loop chains
    var _chains_size = ds_list_size(global.tby_chains);
    if (_chains_size > 0) {
        for (var i = 0; i < _chains_size; i++) {
            var _chain = global.tby_chains[| i];
            if (_chain.pause > 0) {
                _chain.pause--;
                if (_chain.pause == 0) _chain._advance();
            }
        }
    }
};