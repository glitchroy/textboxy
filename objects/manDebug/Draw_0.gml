
if (global.debug) {
    var q = global.tbQueueID;
    var len = (!is_undefined(q) && ds_exists(q, ds_type_queue) && global.tbQueueInProgress) ? string(ds_queue_size(q)+1) : "0"
    var s1 = @"Debug\nActive queue\nQueue length"
    scribble_basic_draw_cached("sprFontMain", s1, 5, 5)
    var s2 = string_bool(global.debug) + "\n" +
             string_bool(global.tbQueueInProgress) + " (" +string(q) + ")\n" +
             len
    scribble_basic_draw_cached("sprFontMain", s2, 90, 5)
}