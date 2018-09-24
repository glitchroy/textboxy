/// @param ttext = ""
/// @param canSelect = false
/// @param tsize = tby_size_create()
//args ttext = "", canSelect = false, tsize:TbySize = new TbySize()
var ttext = argument_count > 0 ? argument[0] : "";
var canSelect = argument_count > 1 ? argument[1] : false;
var tsize/*:TbySize*/ = argument_count > 2 ? argument[2] : tby_size_create();

var tb = instance_create_layer(tsize[TbySize.x], tsize[TbySize.y], tbyLayerText, tbyObjectTextbox)

with (tb) {
    // This is run after tbyObjectTextbox CREATE event, but before the INIT state
    
    selectable = canSelect;
    tbSize = tsize;
    
    // TEXT
    // Replace text from string literals
	ttext = string_replace_all(ttext,"\r\n","\n")
	ttext = string_replace_all(ttext, "\t", "");
	textRaw = ttext;
}

return tb