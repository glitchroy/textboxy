/// @description Call new action

#region Action Loop
// Check if we have actions left
if (ds_queue_empty(actionQueue)) {
	running = false;
	exit;
}
	
var action = ds_queue_dequeue(actionQueue);
if (!is_array(action)) exit; //faulty action, skip it

var actionScript = action[0];
if !script_exists(actionScript) exit; //action does not exist, skip it
currentAction = actionScript;

//delete any old text instances
instance_destroy(tbyTextObject);

var arguments = array_create(0);
array_copy(arguments, 0, action, 1, array_length_1d(action)-1)

//Call the action with arguments
tbySpread(actionScript, arguments);

//when to call new action immediatly?
if (actionScript == TbyAction.ShowString) {
	//Create new string instance, don't advance
	var tc = tbyOriginToTopLeft(
			 ox, oy,
			 min(currentWidth, maxWidth)+tbyTileSize*2,
			 min(lineHeight*currentLines, lineHeight*maxLines)+tbyTileSize*2);

	currentText = tbyT(currentMessage, currentFont, tc[0], tc[1]);
} else {
	//advance to next action
	tbyManagerNextAction;
}

#endregion