/// @desc Creates and returns a new TbyType.Choice textbox.
/// @param _tb_text = ""
/// @param _choices = []
/// @param _tb_placement = TbyPlacement.Auto
var _tb_text = argument_count > 0 ? argument[0] : "";
var _choices = argument_count > 1 ? argument[1] : [];
var _tb_placement = argument_count > 2 ? argument[2] : TbyPlacement.Auto;

var _position/*:TbyPos*/ = tby_normal_get_placement_from_enum(_tb_placement, 3);

var _tb = instance_create_layer(_position[TbyPos.x], _position[TbyPos.y], tby_layer_text, tby_object_choice)

with (_tb) {
    // This is run before the INIT state, but after tby_object_textbox_normal CREATE event
    
    pos = _position;

    // TEXT
    // Replace text from string literals
	_tb_text = string_replace_all(_tb_text,"\r\n","\n")
	_tb_text = string_replace_all(_tb_text, "\t", "");
	
    self.choices = _choices;
    //at which line should the selection start? 
    choice_first_line = string_count("\n", _tb_text);
    // if there preview text but no breaks in it, start at line 1 anyway
	if (_tb_text != "" && choice_first_line == 0) choice_first_line = 1
	
	selected_choice = 0;
	
	var _choice_string = _tb_text != "" ? "\n" : "";

	for (var i = 0; i < tby_arrlen(_choices); i++) {
	    _choice_string += "    " + _choices[i];
	    if (i != tby_arrlen(_choices)-1) _choice_string += "[pause,0.25]\n"
	}
	
	text_raw = _tb_text + _choice_string;
}

return _tb