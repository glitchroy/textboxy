gml_pragma("global", "tby_globals()")

//this call is usually made in __scribble_init() itself per gml_pragma
__scribble_init();

global.tby_debug = false;
global.tby_choice_result = undefined;
global.tby_current_options_map = undefined; tby_reset_options();
global.tby_current_labels_map = undefined;
//TODO: Labels need to work even before they are registered not only after
global.tby_list_map = undefined; //map of ds_list ids <--> names
global.tby_active_list_name = undefined; //ds_list name
global.tby_list_kickoff = false
global.tby_finished_lists_list = undefined;

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