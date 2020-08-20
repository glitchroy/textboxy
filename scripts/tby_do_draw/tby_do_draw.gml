function tby_do_draw() {
    // Draw all frames in order
    var _list = global.tby.frames_list;
    
    tby_foreach(_list, function(_frame, i) {
        _frame.draw();
    })
};