tby_singleton;

tby_scribble_init();

global.tby_branches = ds_map_create();
global.tby_tooltips = ds_map_create();
global.tby_conditions  = ds_map_create();

// If a tooltip should is drawn this step, this is the definition
tooltips = 0;

// Branch to continue with after alarm wait
branch_to_continue = undefined;