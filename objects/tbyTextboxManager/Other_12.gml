/// @description Call new action
if !running exit;

#region Action Loop
// Check if we have actions left
if (ds_queue_empty(actionQueue)) {
	running = false;
	
	// Callback
	if (script_exists(tbyCbOnQueueFinish)) {
		script_execute(tbyCbOnQueueFinish);
	}
	
	exit;
}

var action = ds_queue_dequeue(actionQueue);
if (!is_array(action)) exit; //faulty action, skip it

var actionScript = action[0];
if !script_exists(actionScript) exit; //action does not exist, skip it

//delete any old text instances
instance_destroy(tbyTextObject);

var arguments = array_create(0);
array_copy(arguments, 0, action, 1, array_length_1d(action)-1)

//Call the action with arguments
tbySpread(actionScript, arguments);

//when to call new action immediatly?
if (actionScript != TbyAction.ShowString) {
	//advance to next action
	if (actionScript == TbyAction.SetPause) {
		alarm[1] = globalPause;
	} else {
		tbyManagerNextAction;
	}
}

#endregion