tby_state_cleanup();
if (textScribble != undefined && ds_exists(textScribble, ds_type_map)) {
    scribble_destroy(textScribble);
}