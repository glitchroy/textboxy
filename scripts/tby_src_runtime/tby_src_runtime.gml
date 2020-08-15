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
    
    _meta = {
    	version: tby_version
    }
    
    static _handle_chunk = function(_chunk) {
        try {
            var _type = _chunk.type;
        } catch(_ex) {
            return new TbyException(_ex, "Invalid chunk format.");
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
                tby_pause_register(_seconds*room_speed, self);
            break;
            case "config":
                var _id = _chunk.config_id;
                var _value = _chunk.config_value;
                
                if (variable_struct_exists(config, _id)) {
                    variable_struct_set(config, _id, _value)
                } else {
                    var _ex = new TbyException("Invalid config option \"" + _id + "\".");
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
            	if (!is_undefined(_label_ref)) pointer = _label_ref;
            	
            	_advance();
        }
    };
    
    static _advance = function() {
        if (pointer >= array_length(chunks)) return -1;
        
        // advances according to pointer
        try {
            var _chunk = chunks[pointer];
        } catch(_ex) {
            return new TbyException(_ex, "TbyChain index out of bounds.");
        };
        
        // advance pointer
        pointer++;
        
        _handle_chunk(_chunk);
    };
    
    static run = function() {
        pointer = 0;
        _advance();
    };

    // Scan all chunks for label commands & build map
    static _scan_labels = function() {
    	var _labels = {};
    	for (var i = 0; i < array_length(chunks); i++) {
    		var _chunk = chunks[i];
    		if (_chunk.type != "label") continue;
    		
    		variable_struct_set(_labels, _chunk.name, i);
    	}
    	return _labels;
    }
    labels = _scan_labels();
};

// TbyFrame draws a frame with scribble content,
// but has no autotype associated
function TbyFrame(_chain, _x, _y, _w, _h, _content) constructor {
    tby_frame_register(self);
    
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
        
        tby_frame_remove(self);
    };
    
    static _p_draw = function() {
        var static draw_frame = function(_x1, _y1, _x2, _y2, _size, _spr) {
            var static d = function(_left, _top, _x, _y, _xs, _ys, _spr, _size) {
                draw_sprite_part_ext(_spr, -1, _left*_size, _top*_size,
                _size, _size, _x, _y, _xs, _ys, c_white, 1);
            }
            
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
        }
        
        draw_frame(x, y, x+w, y+h, chain.config.skin.tile_size, chain.config.skin.frame)
        scribble_draw(x+padding, y+padding, content);
        
        if (dismissable()) draw_focus_indicator();
        
        if (tby_debug) {
        	var _d = "";
        	_d += "a_t: " + string(scribble_autotype_get(content));
        	tby_debug_draw(x, y, _d, w)
        }
    };
    
    static draw_focus_indicator = function() {
        draw_sprite(chain.config.skin.confirm, global.tby_blink_timer, x+w, y+h);
    }
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
            y = (tby_game_height - h) / 2
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
        return tby_frame_get_latest() == self && scribble_autotype_get(content) == 1
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
        return scribble_autotype_get(content) == 1 && tby_frame_get_latest() == self 
    };
    
    static draw = function() {
	    var _speaker_sprite = speaker.sprite_index;
		var _bubble_offset = sprite_get_yoffset(chain.config.skin.bubble);
	    bubble_x = speaker.x - sprite_get_xoffset(_speaker_sprite) + speaker.sprite_width/2
	    bubble_y = speaker.y - sprite_get_yoffset(_speaker_sprite) - _bubble_offset;
	    x = bubble_x - w/2;
	    y = bubble_y - h;
		
        _p_draw();
		
		draw_sprite(chain.config.skin.bubble, -1, bubble_x, bubble_y);
    };
};