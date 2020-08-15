function tby_init(){
	if (scribble_init("textboxy/fonts", "font_tby_default", false)) {
		scribble_add_font("font_tby_default");
		scribble_add_font("font_tby_debug");
	}
	
	global.tby_pause_callbacks_list = ds_list_create();
	global.tby_frames_list = ds_list_create();
	global.tby_blink_timer = 0;
	global.tby_debug = true;
	
	#macro tby_version "dev"
	
	#macro tby_is_debug global.tby_debug
}