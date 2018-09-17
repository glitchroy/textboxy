/// @param ttext = ""
/// @param choices = []
/// @param tsize = tbsize_create()
//#args ttext = "", choices = [], tsize:TBSize = new TBSize()
var ttext = argument_count > 0 ? argument[0] : "";
var choices = argument_count > 1 ? argument[1] : [];
var tsize/*:TBSize*/ = argument_count > 2 ? argument[2] : tbsize_create();

var tb = instance_create_layer(tsize[TBSize.x], tsize[TBSize.y], layerText, objTextboxChoice)

with (tb) {
    // This is run before the INIT state, but after objTextbox CREATE event
    
    selectable = true;
    tbSize = tsize;

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

	for (var i = 0; i < arr_length(choices); i++) {
	    choiceString += choices[i];
	    if (i != arr_length(choices)-1) choiceString += "[ev|wait|0.25]\n"
	}
	
	textRaw = ttext + choiceString;
}

return tb