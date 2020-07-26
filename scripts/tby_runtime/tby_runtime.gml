// tby_frames_list : Global list of all TbyFrame instances to draw
global.tby_frames_list = ds_list_create();
global.tby_chains = ds_list_create();

function TbyException(_exception, _custom_message) constructor {
    exception = _exception;
    msg = _custom_message;
    
    // show
    show_message("=== textboxy error===\n\n" + string(msg));
};

function TbyChain(_chunks) constructor {
    ds_list_add(global.tby_chains, self);
    
    chunks = _chunks;
    pointer = 0;
    config = tby_default_config;
    pause = 0;
    
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
                var _frame = new TbyTextbox(self, irandom_range(10, 100), 10, _text, _speed, _placement);
            break;
            case "bubble":
                var _text = _chunk.text;
                var _instance = tby_undefined_safe(_chunk.instance, config.instance);
                var _speed = config.speed;
                var _frame = new TbySpeechBubble(self, irandom_range(10, 100), 100, _text, _speed, _instance);
            break;
            case "pause":
                var _seconds = tby_undefined_safe(_chunk.seconds, 1);
                pause = _seconds*room_speed;
            break;
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
        
        _handle_chunk(_chunk);
        
        // advance pointer
        pointer++;
        // if (pointer >= array_length(chunks)) pointer = 0;
    };
    
    static run = function() {
        pointer = 0;
        _advance();
    };
};

// TbyFrame draws a frame with scribble content,
// but has no autotype associated
function TbyFrame(_chain, _x, _y, _w, _h, _content, _speed) constructor {
    ds_list_add(global.tby_frames_list, self);
    
    chain = _chain;
    speed = _speed;
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    /*static*/ content = scribble_cache(_content);
    scribble_autotype_fade_in(content, speed, 0, false);
    /*static has_focus = function() {
        var _size = ds_list_size(global.tby_frames_list);
        return _size > 0 && global.tby_frames_list[| _size] == self;
    };*/
    static accepts_input = function() {
        return false;
    };
    
    static finish = function() {
        chain._advance();
        
        var _index = ds_list_find_index(global.tby_frames_list, self);
        ds_list_delete(global.tby_frames_list, _index);
    };
    
    static _p_draw = function() {
        draw_set_color(c_orange);
        draw_rectangle(x, y, x+w, y+h, false);
        draw_set_color(c_black);
        scribble_draw(x, y, content);
    };
};

function TbyTextbox(_chain, _x, _y, _content, _speed, _placement) : TbyFrame(_chain, _x, _y, 100, 100, _content, _speed) constructor {
    
    static accepts_input = function() {
        return true;
    };
    
    static draw = function() {
        _p_draw();
        
        if (accepts_input()) {
            // Focus indicator
            draw_set_color(c_green);
            draw_circle(x, y, 5, false);
        }
    };
};

function TbySpeechBubble(_chain, _x, _y, _content, _speed, _speaker) : TbyFrame(_chain, _x, _y, _content, _speed) constructor {
    static accepts_input = function() {
        return true;
    };
    
    static draw = function() {
        _p_draw();
        draw_set_color(c_blue);
        draw_rectangle(x+w/2, y+h, x+(w/2)+5, y+h+5, false);
        
        if (accepts_input()) {
            // Focus indicator
            draw_set_color(c_green);
            draw_circle(x, y, 5, false);
        }
    };
};