/// @desc Creates and returns a new TbyType.Bubble textbox.
/// @param _branch
/// @param _skin
/// @param _content = ""
/// @param _instance = noone
var _branch = argument[0], _skin = argument[1];
var _content = argument_count > 2 ? argument[2] : "";
var _instance = argument_count > 3 ? argument[3] : noone;




// Replace text from string literals
_content = string_replace_all(_content,"\r\n","\n")
_content = string_replace_all(_content, "\t", "");

var _textbox_inst = instance_create_layer(_instance.x, _instance.y, tby_room_layer_name, objTbyTextbox)
with (_textbox_inst) {
	type = TbyType.Bubble
	branch = _branch
	skin = _skin
	
    dimensions = undefined; // Don't calc position yet, since we need text dimensions
    instance = _instance;
	text_raw = _content;
}
return _textbox_inst