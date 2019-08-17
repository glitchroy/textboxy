/// @desc Creates and returns a new TbyType.Normal textbox.
/// @param _content = ""
/// @param _placement = TbyPlacement.Auto
var _content = argument_count > 0 ? argument[0] : "";
var _placement = argument_count > 1 ? argument[1] : TbyPlacement.Auto;

// convert enum position to actual TbyPos instance
var _position/*:TbyPos*/ = tby_normal_calculate_pos_from_placement(_placement, tby_box_lines_per_tb);

// Replace text from string literals
_content = string_replace_all(_content,"\r\n","\n")
_content = string_replace_all(_content, "\t", "");

var _textbox_inst = instance_create_layer(_position[TbyPos.x], _position[TbyPos.y], tby_layer_text, objTbyTextbox)
with (_textbox_inst) {
	type = TbyType.Normal
	
    pos = _position;
	text_raw = _content;
}
return _textbox_inst