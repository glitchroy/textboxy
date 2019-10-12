
#region Command stuff
if (keyboard_check_pressed(ord("M"))) {
    window_scale = example_window_resize(window_scale, window_scale_max);
}

if (keyboard_check_pressed(vk_escape)) game_end();

if (keyboard_check_pressed(vk_f3)) global.tby_debug = !global.tby_debug;
#endregion