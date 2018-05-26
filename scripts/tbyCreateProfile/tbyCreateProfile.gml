///@function tbyCreateProfile(speakerInstance, [messageSound, messageSpeed])
///@desc Returns a profile
///@param speakerInstance
///@param [messageSound
///@param messageSpeed]

var speakerArg = undefined;
var soundArg = undefined;
var speedArg = undefined;

switch(argument_count) {
	case 3: speedArg = argument[2];
	case 2: soundArg = argument[1];
	case 1: speakerArg = argument[0]; break;
}

return [speakerArg, soundArg, speedArg]