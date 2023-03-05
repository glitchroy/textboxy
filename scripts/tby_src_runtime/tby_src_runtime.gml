function TbyException(_custom_message, _exception) constructor {
    exception = _exception == undefined ? "" : _exception;
    msg = _custom_message;
    
    // show
    show_message("=== textboxy error===\n\n" + string(msg));
};

function TbyChain(_chunks) constructor {
    chunks = _chunks;
    pointer = 0;
    config = tby_default_config;
    pause = 0;
    parent_chain = undefined;
    
    _meta = {
    	version: global.__tby.version
    };
    
    static _handle_chunk = function(_chunk) {
        try {
            var _type = _chunk.type;
        } catch(_ex) {
            return new TbyException("Invalid chunk format.", _ex);
        };
        
        // Replaces value in struct, including another nested struct
        // Only works up to 1 level (more isn't needed for the config struct)
        var _struct_replace_deep = function(_key, _val, _struct) {
        	if (string_count(".", _key) == 0) {
        		// nothing nested, simple replace
        		variable_struct_set(_struct, _key, _val);
        		return _struct;
        	}
        	
        	// Otherwise, . is in key
        	var _split_key = tby_split_string(_key, ".");
        	
        	// Nested key
        	// Replace value in nested struct
        	var _nested_struct = variable_struct_get(_struct, _split_key[0]);
        	if (!is_struct(_nested_struct)) _nested_struct = {};
        	
        	variable_struct_set(_nested_struct, _split_key[1], _val);
        	
        	// Replace value in parent struct
        	variable_struct_set(_struct, _split_key[0], _nested_struct);
        	
        	return _struct;
        };
        
        switch (_type) {
            case "box":
                var _text = _chunk.text;
                var _placement = tby_nc_set(_chunk.placement) ? tby_nc_val : config.placement;
                var _speed = config.text.speed;
                var _frame = new TbyTextbox(self, _text, _speed, _placement);
            break;
            case "bubble":
                var _text = _chunk.text;
                var _instance = tby_nc_set(_chunk.instance) ? tby_nc_val : config.bubble.instance;
                var _speed = config.text.speed;
                var _frame = new TbySpeechBubble(self, irandom_range(10, 100), 100, _text, _speed, _instance);
            break;
            case "pause":
                var _seconds = tby_nc_set(_chunk.seconds) ? tby_nc_val : 1;
                global.__tby.pause_register(_seconds*room_speed, self);
            break;
            case "config":
                var _id = _chunk.config_id;
                var _value = _chunk.config_value;
                
                _struct_replace_deep(_id, _value, config);
                
                _advance();
            break;
            case "profile":
            	var _profile = _chunk.profile;
            	if (typeof(_profile) == "struct") {
            		var _config_ids = variable_struct_get_names(_profile);
            		
            		tby_foreach(_config_ids, function(_id, i, _size, _args) {
		                if (variable_struct_exists(_args.config, _id)) {
		                	// Get value
		                	var _value = variable_struct_get(_args.profile, _id);
		                    variable_struct_set(_args.config, _id, _value);
		                }
            		}, {config: config, profile: _profile});
            	} else {
            		var _ex = new TbyException("Profile provided is of type \"" + typeof(_profile) + "\", must be a struct.", undefined);
            	}
            	
            	_advance();
            break;
            case "halt":
            	pointer = 0;
            break;
            case "label":
            	_advance();
            break;
            case "goto":
            	var _name = _chunk.name;
            	
            	var _label_ref = variable_struct_get(labels, _name);
            	
		        if (!is_undefined(_label_ref)) {
		        	pointer = _label_ref;
		        } else {
		            var _ex = new TbyException("Could not find label \"" + _name + "\" in current TbyChain to go to.", undefined);
		        };

            	_advance();
            break;
            case "execute":
            	var _script_name = _chunk.script_name;
            	
            	if (typeof(_script_name) == "method") {
            		// Inline function
            		_script_name(_script_args);
            	} else if (is_real(_script_name) && script_exists(_script_name)) {
            		// Script resource
            		var _script_args = tby_nc_set(_chunk.script_args) ? tby_nc_val : [];
            		tby_spread(_script_name, _script_args);
            	} else {
            		var _ex = new TbyException("Invalid argument \"" + string(_script_name) + "\" for execute, is not a script or function.", undefined);
            	}
            	
            	_advance();
            break;
            case "branch":
            	var _func = _chunk.func;
            	var _chunks_true = _chunk.chunks_true;
            	var _chunks_false = tby_nc_set(_chunk.chunks_false) ? tby_nc_val : [];
            	
            	// evaluate script
            	var _result = _func();
            	
            	if (_result && array_length(_chunks_true) > 0) {
            		// execute true chain
            		var _child = new TbyChain(_chunks_true)._run_as_child(self, config);
            	} else if (!_result && array_length(_chunks_false) > 0) {
            		// execute false chain
            		var _child = new TbyChain(_chunks_false)._run_as_child(self, config);
            	} else {
            		// skip
            		_advance();
            	}
            	
            break;
        }
    };
    
    static _advance = function() {
        if (pointer >= array_length(chunks)) {
        	// advance parent if child
        	if (parent_chain != undefined) parent_chain._advance();
        	return -1;
        }
        
        // advances according to pointer
        try {
            var _chunk = chunks[pointer];
        } catch(_ex) {
            return new TbyException("TbyChain index out of bounds.", _ex);
        };
        
        // advance pointer
        pointer++;
        
        _handle_chunk(_chunk);
    };
    
    static run = function() {
        pointer = 0;
        _advance();
    };
    
    static _run_as_child = function(_parent_chain, _config) {
    	parent_chain = _parent_chain;
    	pointer = 0;
    	config = _config;
    	_advance();
    };

    // Scan all chunks for label commands & build map
    static _scan_labels = function() {
    	var _labels = {};
    	
    	tby_foreach(chunks, function(_chunk, i, _size, _args) {
    		if (_chunk.type == "label") variable_struct_set(_args.labels, _chunk.name, i);
    	}, {labels: _labels});
    	
    	return _labels;
    };
	
    labels = _scan_labels();
};

// TbyFrame draws a frame with arbitrary scribble content (no typewriter)
function TbyFrame(_chain) constructor {
    global.__tby.frame_register(self);
    chain = _chain;
    padding = chain.config.skin.tile_size;
    
    static dismissable = function() {
        return false;
    };
    
    static finish = function() {
        chain._advance();
        global.__tby.frame_remove(self);
    };
    
    static draw_frame = function(_x, _y, _w, _h) {
        var static _frame = function(_x1, _y1, _x2, _y2, _size, _spr) {
        	
            var static d = function(_left, _top, _x, _y, _xs, _ys, _spr, _size) {
                draw_sprite_part_ext(_spr, -1, _left*_size, _top*_size, _size, _size, _x, _y, _xs, _ys, c_white, 1);
            };
            
            var _w = _x2 - _x1 - _size*2;
            var _h = _y2 - _y1 - _size*2;
            
            d(0, 0, _x1,          _y1,          1,        1,        _spr, _size);
            d(1, 0, _x1+_size,    _y1,          _w/_size, 1,        _spr, _size);
            d(2, 0, _x1+_w+_size, _y1,          1,        1,        _spr, _size);
            
            d(0, 1, _x1,          _y1+_size,    1,        _h/_size, _spr, _size);
            d(1, 1, _x1+_size,    _y1+_size,    _w/_size, _h/_size, _spr, _size);
            d(2, 1, _x1+_w+_size, _y1+_size,    1,        _h/_size, _spr, _size);
            
            d(0, 2, _x1,          _y1+_h+_size, 1,        1,        _spr, _size);
            d(1, 2, _x1+_size,    _y1+_h+_size, _w/_size, 1,        _spr, _size);
            d(2, 2, _x1+_w+_size, _y1+_h+_size, 1,        1,        _spr, _size);
        };
        
        _frame(_x, _y, _x+_w, _y+_h, chain.config.skin.tile_size, chain.config.skin.frame);
        
        content.draw(_x+padding, _y+padding, typist);
        
        if (dismissable()) draw_focus_indicator();
        
        if (tby_debug_mode) {
        	var _d = "";
        	_d += "a_t: " + string(typist.get_state());
        	_d += "| w: " + string(_w) + ", h: " + string(_h);
        	tby_debug_draw(_x, _y, _d, _w, c_white);
        }
    };
    
    static draw_focus_indicator = function() {
        draw_sprite(chain.config.skin.confirm, global.__tby.blink_timer, x+w, y+h);
    };
};

function TbyTextbox(_chain, _text, _speed, _placement) : TbyFrame(_chain) constructor {
	chain = _chain;
    
    x = tby_box_padding / 2;
    w = tby_game_width - tby_box_padding;
    h = tby_box_height;
    y = function(_placement) {
	    switch (_placement) {
	        case "top":
	        case "t":
	            return 0;
	        break;
	        case "middle":
	        case "center":
	        case "mid":
	        case "c":
	        case "m":
	            return (tby_game_height - h) / 2;
	        break;
	        case "auto":
	        case "bottom":
	        case "b":
	        case "bot":
	            return tby_game_height - h;
	        break;
	    }
    }(_placement);
    
    typist = scribble_typist();
    typist.in(_speed, 0);
    
    content = scribble(_text)
    	.starting_format(chain.config.text.font, chain.config.text.color)
    	.align(chain.config.text.halign)
    	.wrap(w-padding*2, h-padding*2)
    
    static dismissable = function() {
        return global.__tby.frame_get_latest() == self && typist.get_state() == 1;
    };
    
    static draw = function() {
        draw_frame(x, y, w, h);
    };
};

function TbySpeechBubble(_chain, _x, _y, _text, _speed, _speaker) : TbyFrame(_chain) constructor {
    speaker = tby_nc_set(_speaker) ? tby_nc_val : id;
    
    typist = scribble_typist();
    typist.in(_speed, 0);
    
    content = scribble(_text)
    	.starting_format(chain.config.text.font, chain.config.text.color)
    	.align(chain.config.text.halign);
    
    // Define default w/h with presets or -1
	var _max_w = tby_nc_set(chain.config.bubble.max_width) ? tby_nc_val : -1;
    var _max_h = tby_nc_set(chain.config.bubble.max_height) ? tby_nc_val : -1;
    content.wrap(_max_w, _max_h);
    
    // Set actual size
    w = min(_max_w, content.get_width()) + padding*2;
    h = min(_max_h, content.get_height()) + padding*2;
    
    content.wrap(w-padding*2, h-padding*2);

    static dismissable = function() {
        return global.__tby.frame_get_latest() == self && typist.get_state() == 1;
    };
    
    static draw = function() {
	    var _speaker_sprite = speaker.sprite_index;
		var _bubble_offset = sprite_get_yoffset(chain.config.skin.bubble);
	    bubble_x = speaker.x - sprite_get_xoffset(_speaker_sprite) + speaker.sprite_width/2;
	    bubble_y = speaker.y - sprite_get_yoffset(_speaker_sprite) - _bubble_offset;
	    x = bubble_x - w/2;
	    y = bubble_y - h;
		
        draw_frame(x, y, w, h);
		
		draw_sprite(chain.config.skin.bubble, -1, bubble_x, bubble_y);
    };
};