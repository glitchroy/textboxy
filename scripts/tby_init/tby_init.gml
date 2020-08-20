function tby_init(){
	if (scribble_init("textboxy/fonts", "font_tby_default", false)) {
		scribble_add_font("font_tby_default");
		scribble_add_font("font_tby_debug");
	}
	
	global.tby = new TbyGlobal();
	
	#macro tby_debug_mode global.tby.debug
};

function TbyGlobal() constructor {
	pause_callbacks_list = ds_list_create();
	frames_list = ds_list_create();
	blink_timer = 0;
	debug = true;
	version = "indev";
    
    static pause_register = function(_time, _chain_context) {
	    ds_list_add(pause_callbacks_list, { timer: _time, chain: _chain_context });
	};
	
	static frame_register = function(_frame_context) {
	    ds_list_insert(frames_list, 0, _frame_context);
	};
	
	static frame_remove = function(_frame_context) {
	    var _index = ds_list_find_index(frames_list, _frame_context);
	    ds_list_delete(frames_list, _index);
	};
	
	static frame_get_latest = function() {
	    if (ds_list_empty(frames_list)) return undefined;
	    return frames_list[| ds_list_size(frames_list)-1];
	};
	
	/* step functions */
	
	// Tick all open timers & execute advance if neccessary
	static _advance_pause_timers = function() {
        var i = 0;
        while (i < ds_list_size(pause_callbacks_list)) {
            var cb_object = pause_callbacks_list[| i];
            
            if (cb_object.timer == 0) {
                cb_object.chain._advance();
                ds_list_delete(pause_callbacks_list, i);
                // don't advance because entries shift
            } else {
                cb_object.timer--;
                i++;
            }
        }
    };
    
    // Finish every frame that is dismissable
    static _input_check_confirm = function() {
    	tby_foreach(frames_list, function(_frame, i) {
    		if (_frame != undefined && _frame.dismissable()) {
    			_frame.finish();
    		}
    	}, []);
    };
    
	static _blink_advance = function() {
		blink_timer += tby_confirm_blink_speed;
		if (blink_timer >= 2) blink_timer = 0;
	};
    
    static step = function() {
	    _blink_advance();
	    if (ds_list_size(pause_callbacks_list) > 0) _advance_pause_timers();
	    if (tby_input_confirm) _input_check_confirm();
    };
    
    static destroy = function() {
        if (ds_exists(pause_callbacks_list, ds_type_list)) ds_list_destroy(pause_callbacks_list);
        if (ds_exists(frames_list, ds_type_list))         ds_list_destroy(frames_list);
    };
};
