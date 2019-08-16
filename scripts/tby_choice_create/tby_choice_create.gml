/// @desc Creates and returns a new TbyType.Choice textbox.
/// @param tbText = ""
/// @param choices = []
/// @param tbPlacement = TbyPlacement.Auto
var tbText = argument_count > 0 ? argument[0] : "";
var choices = argument_count > 1 ? argument[1] : [];
var tbPlacement = argument_count > 2 ? argument[2] : TbyPlacement.Auto;

var position/*:TbyPos*/ = tby_normal_get_placement_from_enum(tbPlacement, 3);

var tb = instance_create_layer(position[TbyPos.x], position[TbyPos.y], tby_layer_text, tby_object_choice)

with (tb) {
    // This is run before the INIT state, but after tby_object_textbox_normal CREATE event
    
    //selectable = true;
    //textSize = size;

    pos = position;

    // TEXT
    // Replace text from string literals
	tbText = string_replace_all(tbText,"\r\n","\n")
	tbText = string_replace_all(tbText, "\t", "");
	
    self.choices = choices;
    //at which line should the selection start? 
    choiceFirstLine = string_count("\n", tbText);
    // if there preview text but no breaks in it, start at line 1 anyway
	if (tbText != "" && choiceFirstLine == 0) choiceFirstLine = 1
	
	selectedChoice = 0;
	
	var choiceString = tbText != "" ? "\n" : "";

	for (var i = 0; i < tby_arrlen(choices); i++) {
	    choiceString += "    " + choices[i];
	    if (i != tby_arrlen(choices)-1) choiceString += "[pause,0.25]\n"
	}
	
	textRaw = tbText + choiceString;
}

return tb