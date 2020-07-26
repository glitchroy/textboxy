function TbyChunk() constructor {
    static add = {
    	//frame:  function(_text, _x, _y, _w, _h) { return { type: "frame", text: _text, x: _x, y: _y, w: _w, h: _h }; },
        box:	function(_text, _placement)	    { return { type: "box", text: _text, placement: _placement }; },
		bubble: function(_text, _instance)	    { return { type: "bubble", text: _text, instance: _instance }; },
		// choice
		config: function(_id, _value)           { return { type: "config", config_id: _id, config_value: _value }; },
		halt:   function()                      { return { type: "halt" }; },
		// goto
		// if
		// label
		pause:  function(_seconds)              { return { type: "pause", seconds: _seconds }; }
		// script
		// select
		// setvar
    };
};