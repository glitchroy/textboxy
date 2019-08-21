/// @desc Defines globals for textboxy. Executes on boot via gml_pragma.

gml_pragma("global", "tby_globals()")

// This bool holds if the debug mode for textboxy is active.
global.tby_debug = tby_debug_on_startup;

// This int holds the result of the latest TbyChoice call
global.tby_choice_result = undefined;

/* This ds_map holds all defined branch payloads and the respective branch name as keys. */
global.tby_branches = undefined;

/* This ds_map holds all defined tooltips and their payloads. */
global.tby_tooltips = undefined;

/* This ds_map holds all the key and value pairs that are
   defined by an external file, using tby_init_external_strings.
   Otherwise, it is undefined. */
global.tby_external_strings_map = undefined;

// So this doesn't get computed every time it is called
global.tby_skin_tile_size = sprite_get_width(tby_array_get(tby_default_skin, TbySkin.Frame))

//Create Text layer if it doesn't exist
layer_set_target_room(room_first)
if (!layer_exists(tby_layer_text)) {
	layer_create(-1000, tby_layer_text);
}
layer_reset_target_room()

if (!instance_exists(tby_object_manager)) {
	room_instance_add(room_first, 0, 0, tby_object_manager);
}

if (tby_use_external_lang_file) {
	tby_init_external_strings(tby_default_external_lang_file)
}