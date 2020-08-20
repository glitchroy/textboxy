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
    	version: global.tby.version
    };
    
    static _handle_chunk = function(_chunk) {
        try {
            var _type = _chunk.type;
        } catch(_ex) {
            return new TbyException("Invalid chunk format.", _ex);
        };
        
        switch (_type) {
            case "box":
                var _text = _chunk.text;
                var _placement = tby_undefined_safe(_chunk.placement, config.placement);
                var _speed = config.speed;
                var _frame = new TbyTextbox(self, _text, _speed, _placement);
            break;
            case "bubble":
                var _text = _chunk.text;
                var _instance = tby_undefined_safe(_chunk.instance, config.instance);
                var _speed = config.speed;
                var _frame = new TbySpeechBubble(self, irandom_range(10, 100), 100, _text, _speed, _instance);
            break;
            case "pause":
                var _seconds = tby_undefined_safe(_chunk.seconds, 1);
                global.tby.pause_register(_seconds*room_speed, self);
            break;
            case "config":
                var _id = _chunk.config_id;
                var _value = _chunk.config_value;
                
                if (variable_struct_exists(config, _id)) {
                    variable_struct_set(config, _id, _value);
                } else {
                    var _ex = new TbyException("Invalid config option \"" + _id + "\".", undefined);
                }
                
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
            		var _script_args = tby_undefined_safe(_chunk.script_args, []);
            		tby_spread(_script_name, _script_args);
            	} else {
            		var _ex = new TbyException("Invalid argument \"" + string(_script_name) + "\" for execute, is not a script or function.", undefined);
            	}
            	
            	_advance();
            break;
            case "branch":
            	var _func = _chunk.func;
            	var _chunks_true = _chunk.chunks_true;
            	var _chunks_false = tby_undefined_safe(_chunk.chunks_false, []);
            	
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

// TbyFrame draws a frame with scribble content,
// but has no autotype associated
function TbyFrame(_chain, _x, _y, _w, _h, _content) constructor {
    global.tby.frame_register(self);
    
    chain = _chain;
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    
    scribble_set_starting_format(
        chain.config.text.font,
        chain.config.text.color,
        chain.config.text.halign
    );
    content = scribble_cache(_content);
    padding = chain.config.skin.tile_size;

    static dismissable = function() {
        return false;
    };
    
    static finish = function() {
        chain._advance();
        
        global.tby.frame_remove(self);
    };
    
    static _p_draw = function() {
        var static draw_frame = function(_x1, _y1, _x2, _y2, _size, _spr) {
            var static d = function(_left, _top, _x, _y, _xs, _ys, _spr, _size) {
                draw_sprite_part_ext(_spr, -1, _left*_size, _top*_size,
                _size, _size, _x, _y, _xs, _ys, c_white, 1);
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
        
        draw_frame(x, y, x+w, y+h, chain.config.skin.tile_size, chain.config.skin.frame);
        scribble_draw(x+padding, y+padding, content);
        
        if (dismissable()) draw_focus_indicator();
        
        if (tby_debug_mode) {
        	var _d = "";
        	_d += "a_t: " + string(scribble_autotype_get(content));
        	tby_debug_draw(x, y, _d, w, c_white);
        }
    };
    
    static draw_focus_indicator = function() {
        draw_sprite(chain.config.skin.confirm, global.tby.blink_timer, x+w, y+h);
    };
};

function TbyTextbox(_chain, _content, _speed, _placement) : TbyFrame(_chain, 0, 0, 1, 1, _content) constructor {
    placement = _placement;
    speed = _speed;
    
    x = tby_box_padding / 2;
    w = tby_game_width - tby_box_padding;
    h = 100;
    
    switch (placement) {
        case "top":
        case "t":
            y = 0;
        break;
        case "middle":
        case "center":
        case "mid":
        case "c":
        case "m":
            y = (tby_game_height - h) / 2;
        break;
        case "auto":
        case "bottom":
        case "b":
        case "bot":
            y = tby_game_height - h;
        break;
    }
    
    scribble_autotype_fade_in(content, speed, 0, false);
    scribble_set_wrap(w-padding*2, h-padding*2);
    
    static dismissable = function() {
        return global.tby.frame_get_latest() == self && scribble_autotype_get(content) == 1;
    };
    
    static draw = function() {
        _p_draw();
    };
};

function TbySpeechBubble(_chain, _x, _y, _content, _speed, _speaker) : TbyFrame(_chain, 0, 0, 1, 1, _content) constructor {
    speed = _speed;
    speaker = _speaker == noone ? id : _speaker;
    
    w = scribble_get_width(content) + padding*2;
    h = scribble_get_height(content) + padding*2;
	
    scribble_autotype_fade_in(content, speed, 0, false);
    scribble_set_wrap(w-padding*2, h-padding*2);
    
    static dismissable = function() {
        return global.tby.frame_get_latest() == self && scribble_autotype_get(content) == 1;
    };
    
    static draw = function() {
	    var _speaker_sprite = speaker.sprite_index;
		var _bubble_offset = sprite_get_yoffset(chain.config.skin.bubble);
	    bubble_x = speaker.x - sprite_get_xoffset(_speaker_sprite) + speaker.sprite_width/2;
	    bubble_y = speaker.y - sprite_get_yoffset(_speaker_sprite) - _bubble_offset;
	    x = bubble_x - w/2;
	    y = bubble_y - h;
		
        _p_draw();
		
		draw_sprite(chain.config.skin.bubble, -1, bubble_x, bubble_y);
    };
};