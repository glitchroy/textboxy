// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function tby_do_draw() {
    // Draw all frames in order
    var _size = ds_list_size(global.tby_frames_list);
    if (_size == 0) exit;
    
    for (var i = 0; i < _size; i++) {
        var _frame = global.tby_frames_list[| i];
        _frame.draw();
    }
};