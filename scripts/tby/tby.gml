///@function tby([speaker, speed], string)
///@desc Shorthand for message box creation
///@param [speaker
///@param speed]
///@param string

var speakerArg = undefined;
var speedArg = undefined;
var textArg = undefined;

var setDefaultSpeaker = true;
var setDefaultSpeed = true;
with (tbyM()) {
	// defaults are the currently defined
	speakerArg = speaker;
	speedArg = standardWait;
}

switch (argument_count) {
	case 3: speakerArg = argument[0];
			speedArg = argument[1];
			textArg = argument[2];
			setDefaultSpeaker = false
			setDefaultSpeed = false;
			break;
	case 2: speakerArg = argument[0];
			textArg = argument[1];
			setDefaultSpeaker = false;
			break;
	case 1: textArg = argument[0];
			break;
}

// If the values are not set by the user or
// no default was found, do not update them.
// Because of this, values that are not specified
// do not get overwritten

if (speakerArg != undefined && speakerArg != noone && !setDefaultSpeaker) {
	tbyAddAction(TbyAction.SetSpeaker, speakerArg);
}
if (speedArg != undefined && !setDefaultSpeed) {
	tbyAddAction(TbyAction.SetSpeed, speedArg);
}
if (textArg != undefined && textArg != "") {
	tbyAddAction(TbyAction.ShowString, textArg);
}