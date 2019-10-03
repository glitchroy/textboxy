tby_state_cleanup();

if (scribble != undefined && ds_exists(scribble, ds_type_map)) {
    scribble_destroy(scribble);
}