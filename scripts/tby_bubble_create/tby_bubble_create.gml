/// @desc Creates and returns a new TbyType.Bubble textbox.
/// @param _content = ""
/// @param _instance = noone
var _content = argument_count > 0 ? argument[0] : "";
var _instance = argument_count > 1 ? argument[1] : noone;

// Don't calc position yet, since we need text dimensions


var _textbox_inst = instance_create_layer(_instance.x, _instance.y, tby_layer_text, objTbyTextbox)

// Replace text from string literals
_content = string_replace_all(_content,"\r\n","\n")
_content = string_replace_all(_content, "\t", "");

with (_textbox_inst) {
	type = TbyType.Bubble
	
    inst = _instance;
	text_raw = _content;
	
	event_user(0)
}

return _textbox_inst