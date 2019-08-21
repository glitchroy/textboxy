/// @desc Creates and returns a new TbyType.Bubble textbox.
/// @param _branch
/// @param _content = ""
/// @param _instance = noone
var _branch = argument[0];
var _content = argument_count > 1 ? argument[1] : "";
var _instance = argument_count > 2 ? argument[2] : noone;




// Replace text from string literals
_content = string_replace_all(_content,"\r\n","\n")
_content = string_replace_all(_content, "\t", "");

var _textbox_inst = instance_create_layer(_instance.x, _instance.y, tby_layer_text, objTbyTextbox)
with (_textbox_inst) {
	type = TbyType.Bubble
	branch = _branch
	
    dimensions = undefined; // Don't calc position yet, since we need text dimensions
    instance = _instance;
	text_raw = _content;
}
return _textbox_inst