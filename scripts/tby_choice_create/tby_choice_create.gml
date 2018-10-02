/// @param ttext = ""
/// @param choices = []
/// @param tsize = tby_size_create()
//#args ttext = "", choices = [], tsize:TbySize = new TbySize()
var ttext = argument_count > 0 ? argument[0] : "";
var choices = argument_count > 1 ? argument[1] : [];
var tsize/*:TbySize*/ = argument_count > 2 ? argument[2] : tby_size_create();

var tb = instance_create_layer(tsize[TbySize.x], tsize[TbySize.y], tby_layer_text, tby_object_choice)

with (tb) {
    // This is run before the INIT state, but after tby_object_textbox CREATE event
    
    selectable = true;
    textSize = tsize;

    // TEXT
    // Replace text from string literals
	ttext = string_replace_all(ttext,"\r\n","\n")
	ttext = string_replace_all(ttext, "\t", "");
	
    self.choices = choices;
    //at which line should the selection start? 
    choiceFirstLine = string_count("\n", ttext);
	if (ttext != "" && choiceFirstLine == 0) choiceFirstLine = 1
	
	selectedChoice = 0;
	
	var choiceString = ttext != "" ? "\n" : "";

	for (var i = 0; i < tby_arrlen(choices); i++) {
	    choiceString += choices[i];
	    if (i != tby_arrlen(choices)-1) choiceString += "[ev|wait|0.25]\n"
	}
	
	textRaw = ttext + choiceString;
}

return tb