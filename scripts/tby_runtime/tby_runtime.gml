function TbyException(_exception, _custom_message) constructor {
    exception = _exception;
    msg = _custom_message;
    
    // show
    show_message("=== textboxy error===\n\n" + string(msg));
};

function TbyChain(_chunks) constructor {
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
                //pause = _seconds*room_speed;
                tby_pause_register(_seconds*room_speed, self);
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
function TbyFrame(_chain, _x, _y, _w, _h, _content) constructor {
    tby_frame_register(self);
    
    chain = _chain;
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    /*static*/ content = scribble_cache(_content);

    static dismissable = function() {
        return false;
    };
    
    static finish = function() {
        chain._advance();
        
        tby_frame_remove(self);
    };
    
    static _p_draw = function() {
        draw_set_color(c_orange);
        draw_rectangle(x, y, x+w, y+h, false);
        draw_set_color(c_black);
        scribble_draw(x, y, content);
        
        if (dismissable()) draw_focus_indicator();
    };
    
    static draw_focus_indicator = function() {
        draw_set_color(c_green);
        draw_circle(x+w, y+h, 5, false);
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
    scribble_set_wrap(w, h);
    
    static dismissable = function() {
        return scribble_autotype_get(content) == 1
    };
    
    static draw = function() {
        _p_draw();
    };
};

function TbySpeechBubble(_chain, _x, _y, _content, _speed, _speaker) : TbyFrame(_chain, _x, _y, _content) constructor {
    static dismissable = function() {
        return true;
    };
    
    static draw = function() {
        _p_draw();
    };
};