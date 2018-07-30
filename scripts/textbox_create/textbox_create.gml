/// @param ttext = ""
/// @param canSelect = false
/// @param tsize = tbsize_create();
//args ttext = "", canSelect = false, tsize:TBSize = new TBSize();
var ttext = argument_count > 0 ? argument[0] : "";
var canSelect = argument_count > 1 ? argument[1] : false;
var tsize/*:TBSize*/ = argument_count > 2 ? argument[2] : tbsize_create();;

var tb = instance_create_layer(tsize[TBSize.x], tsize[TBSize.y], layerText, objTextbox)

with (tb) {
    selectable = canSelect;
    tbSize = tsize;

    // TEXT
    // Replace text from string literals
	ttext = string_replace_all(ttext,"\r\n","\n")
	ttext = string_replace_all(ttext, "\t", "");
	textRaw = ttext;
}

return tb