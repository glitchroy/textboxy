/// @param ttext = ""
/// @param canSelect = false
/// @param tx = gameWidth/2
/// @param ty = gameHeight/2
/// @param ?tsize = undefined
var ttext = argument_count > 0 ? argument[0] : "";
var canSelect = argument_count > 1 ? argument[1] : false;
var tx = argument_count > 2 ? argument[2] : gameWidth/2;
var ty = argument_count > 3 ? argument[3] : gameHeight/2;
var tsize = argument_count > 4 ? argument[4] : undefined;

var tb = instance_create_layer(tx, ty, layerText, objTextbox)

with (tb) {
    // Replace text from string literals
	ttext = string_replace_all(ttext,"\r\n","\n")
	ttext = string_replace_all(ttext, "\t", "");
	
    //Size
    var maxWidth = gameWidth;
    if (is_array(tsize)) {
        size = tsize;
        maxWidth = tsize[TBSize.width]
    }
    
    textRaw = ttext;
    selectable = canSelect;
    
    text = scribble_create(textRaw, maxWidth, "sprFontMain",
    					   fa_left, c_white, 0);
    					   
    //set origin point of box to middle
    scribble_set_box_alignment(text); 
    
    //set fade in to 0 to begin with
    scribble_set_char_fade_direct(text, 0, smoothness);
    
    //Defaults
    scribble_set_shake(text, 1.2)
    scribble_set_wave(text, 2)
    
    //do selection
    if (selectable) {
        with (objTextbox) selected = false;
        selected = true;
    }

}

return tb