gml_pragma("global", "tby_globals()")

global.tby_debug = true;
global.tby_choice_result = undefined;
global.tby_current_options_map = undefined; tby_reset_options();
global.tby_current_labels_map = undefined;
global.tby_list_map = undefined; //map of ds_list ids <--> names
global.tby_active_list_name = undefined; //ds_list name
global.tby_finished_lists_list = undefined;

global.tby_external_strings_map = undefined;

// So this doesn't get computed every time it is called
global.tby_skin_tile_size = sprite_get_width(tby_array_get(tby_get_option(TbyOption.SetSkin), TbySkin.Frame))

//Create Text layer if it doesn't exist
layer_set_target_room(room_first)
if (!layer_exists(tby_layer_text)) {
	layer_create(-1000, tby_layer_text);
}
layer_reset_target_room()

// From __scrible_init()
if (!instance_exists(tby_object_manager)) {
	room_instance_add(room_first, 0, 0, tby_object_manager);
}

if (tby_use_external_lang_file) {
	tby_init_external_strings(tby_default_external_lang_file)
}