// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function tby_do_draw() {
    // Draw all frames in order
    var _list = tby_frame_get();
    
    var _size = ds_list_size(_list);
    if (_size == 0) exit;
    
    for (var i = 0; i < _size; i++) {
        var _frame = _list[| i];
        _frame.draw();
    }
};