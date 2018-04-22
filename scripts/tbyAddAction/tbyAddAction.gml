///@function tbyAddAction(action, args...)
///@desc Add action to queue
///@param action
///@param args (optional)

//Action Format: [ActionEnum, args, args, ...]

var action = [argument[0]];

switch (argument_count) {
	case 3: action[2] = argument[2];
	case 2: action[1] = argument[1];
	break;
}

with (tbyM()) {
	ds_queue_enqueue(actionQueue, action);
}