tby_singleton;

tby_init_scribble();

global.tby_branches = ds_map_create();
global.tby_tooltips = ds_map_create();

// If a tooltip should is drawn this step, this is the definition
tooltips = 0;