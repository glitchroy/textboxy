function tby_do_draw() {
    // Draw all frames in order
    var _list = tby_frame_list_get();
    
    var _size = ds_list_size(_list);
    if (_size == 0) exit;
    
    for (var i = 0; i < _size; i++) {
        var _frame = _list[| i];
        _frame.draw();
    }
};