/// @desc Creates and returns a new TbyType.Bubble textbox.
/// @param tbText 
/// @param tbInstance
var tbText = argument0, tbInstance = argument1;

// Don't calc position yet, since we need text dimensions

var tb = instance_create_layer(tbInstance.x, tbInstance.y, tby_layer_text, tby_object_textbox_bubble)

with (tb) {
    // This is run after tby_object_textbox_normal CREATE event, but before the INIT state
    inst = tbInstance;
    
    // Replace text from string literals
	tbText = string_replace_all(tbText,"\r\n","\n")
	tbText = string_replace_all(tbText, "\t", "");
	textRaw = tbText;
}

return tb