
if (global.debug) {
    draw_set_color(c_black);
    draw_set_alpha(0.75)
    draw_rectangle(0, 0, 110, 35, false)
    draw_set_alpha(1)
    var q = global.tbQueueID;
    var queueID = is_undefined(global.tbQueueID) ? "-" : string(global.tbQueueID)
    var len = (!is_undefined(q) && ds_exists(q, ds_type_queue) && global.tbQueueInProgress) ? string(ds_queue_size(q)) : "0"
    var s1 = @"Debug#Active queue#Queue length"
    scribble_basic_draw_cached("sprFontSmall", string_upper(s1), 5, 5)
    var s2 = ": " + string_bool(global.debug) + "#: " +
             string_bool(global.tbQueueInProgress) + " (" + string(queueID) + ")#: " +
             len
    scribble_basic_draw_cached("sprFontSmall", string_upper(s2), 65, 5)
}