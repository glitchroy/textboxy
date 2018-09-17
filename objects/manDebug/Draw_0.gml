
if (global.debug) {
    var q = textbox_queue_get_active_id();
    var str = "Debug: \t\t" + string_bool(global.debug) +
            "\nActive queue: \t\t" + string(global.tbActiveQueueName) + " (" + string(q) + ")" +
            "\nQueue length: \t\t" + string(q ? ds_queue_size(q) : "-") +
            "\nChoice result: \t\t" + string(global.tbChoiceResult)
    
    draw_set_color(c_black);
    draw_set_alpha(0.75)
    draw_rectangle(0, 0, 115, 35, false)
    draw_set_alpha(1)

    scribble_basic_draw_cached("sprFontSmall", string_upper(str), 5, 5)
}