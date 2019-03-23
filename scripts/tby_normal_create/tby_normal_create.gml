/// @param tbText = ""
/// @param tbPlacement = TbyPlacement.Auto
var tbText = argument_count > 0 ? argument[0] : "";
var tbPlacement = argument_count > 1 ? argument[1] : TbyPlacement.Auto;

// convert enum position to actual TbyPos instance

var position/*:TbyPos*/ = tby_normal_get_placement_from_enum(tbPlacement, tby_box_lines_per_tb);

var tb = instance_create_layer(position[TbyPos.x], position[TbyPos.y], tby_layer_text, tby_object_textbox_normal)

with (tb) {
    // This is run after tby_object_textbox_normal CREATE event, but before the INIT state

    pos = position;
    
    // TEXT
    // Replace text from string literals
	tbText = string_replace_all(tbText,"\r\n","\n")
	tbText = string_replace_all(tbText, "\t", "");
	textRaw = tbText;
}

return tb