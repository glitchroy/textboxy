tby_state_cleanup();
if (text_scribble != undefined && ds_exists(text_scribble, ds_type_map)) {
    scribble_destroy(text_scribble);
}