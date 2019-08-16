/// @desc Creates and returns a new TbyType.Bubble textbox.
/// @param _tb_text 
/// @param _tb_instance
var _tb_text = argument0, _tb_instance = argument1;

// Don't calc position yet, since we need text dimensions

var _tb = instance_create_layer(_tb_instance.x, _tb_instance.y, tby_layer_text, tby_object_textbox_bubble)

with (_tb) {
    // This is run after tby_object_textbox_normal CREATE event, but before the INIT state
    inst = _tb_instance;
    
    // Replace text from string literals
	_tb_text = string_replace_all(_tb_text,"\r\n","\n")
	_tb_text = string_replace_all(_tb_text, "\t", "");
	text_raw = _tb_text;
}

return _tb