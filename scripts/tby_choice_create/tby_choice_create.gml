/// @desc Creates and returns a new TbyType.Choice textbox.
/// @param _branch
/// @param _content = ""
/// @param _choices = []
/// @param _placement = TbyPlacement.Auto
var _branch = argument[0];
var _content = argument_count > 1 ? argument[1] : "";
var _choices = argument_count > 2 ? argument[2] : [];
var _placement = argument_count > 3 ? argument[3] : TbyPlacement.Auto;

var _dim/*:TbyDim*/ = tby_normal_dimensions_from_placement(_placement, 3);

// Replace text from string literals
_content = string_replace_all(_content,"\r\n","\n")
_content = string_replace_all(_content, "\t", "");

var _textbox_inst = instance_create_layer(_dim[TbyDim.x], _dim[TbyDim.y], tby_room_layer_name, objTbyTextbox)
with (_textbox_inst) {
	type = TbyType.Choice
	branch = _branch
	
    dimensions = _dim;
    choices = _choices;
    selected_choice = 0;
    //at which line should the selection start? 
    choice_first_line = string_count("\n", _content);
    // if there preview text but no breaks in it, start at line 1 anyway
	if (_content != "" && choice_first_line == 0) choice_first_line = 1
	
	var _choice_string = _content != "" ? "\n" : "";
	for (var i = 0; i < tby_arrlen(_choices); i++) {
	    _choice_string += "    " + _choices[i];
	    if (i != tby_arrlen(_choices)-1) _choice_string += "[pause,0.25]\n"
	}
	
	text_raw = _content + _choice_string;
}
return _textbox_inst