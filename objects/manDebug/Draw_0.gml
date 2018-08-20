
if (global.debug) {
    draw_set_color(c_black);
    draw_set_alpha(0.75)
    draw_rectangle(0, 0, 115, 35, false)
    draw_set_alpha(1)
    var q = textbox_queue_get_active_id();
    var qname = ds_exists(q, ds_type_queue) ? global.tbActiveQueueName : "-"
    var len = ds_exists(q, ds_type_queue) ? string(ds_queue_size(q)) : "-"
    var s1 = @"Debug#Active queue#Queue length#Choice result"
    scribble_basic_draw_cached("sprFontSmall", string_upper(s1), 5, 5)
    var s2 = ": " + string_bool(global.debug) + "#: " +
             string_bool(textbox_queue_get_active_id()) + " (" + qname + ")#: " +
             len + "#: " +
             string(global.tbChoiceResult)
    scribble_basic_draw_cached("sprFontSmall", string_upper(s2), 65, 5)
}