/// @desc Creates and returns a new TbyType.Normal textbox.
/// @param _tb_text = ""
/// @param _tb_placement = TbyPlacement.Auto
var _tb_text = argument_count > 0 ? argument[0] : "";
var _tb_placement = argument_count > 1 ? argument[1] : TbyPlacement.Auto;

// convert enum position to actual TbyPos instance

var _position/*:TbyPos*/ = tby_normal_get_placement_from_enum(_tb_placement, tby_box_lines_per_tb);

var _tb = instance_create_layer(_position[TbyPos.x], _position[TbyPos.y], tby_layer_text, tby_object_textbox_normal)

// Replace text from string literals
_tb_text = string_replace_all(_tb_text,"\r\n","\n")
_tb_text = string_replace_all(_tb_text, "\t", "");

with (_tb) {
    // This is run after tby_object_textbox_normal CREATE event, but before the INIT state

    pos = _position;
    
    // TEXT
	text_raw = _tb_text;
}

return _tb