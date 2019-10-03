tby_singleton;

tby_scribble_init();

global.tby_conditions  = ds_map_create();

// Array of tooltips to be drawn this step
tooltips = 0;

// Current executing branch
branch = undefined;

// Branch to continue with after alarm wait
branch_to_continue = undefined;