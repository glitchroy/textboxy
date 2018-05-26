/// @description (Re-)initialize variables

#region Explanation
/* Why do we initialize here and not in Create?
Simple answer: We re-use this script for
tbyReset() purposes.
Since deleting and re-creating the manager would
take until the next step after execution, it's
not an option if the user wants to reset
mid-dialogue. So this is the alternative.
You'll note that some variables do get defined in
the Create event. These need to exist during a reset
or a important for tracking the reset.*/
#endregion


if (!ds_exists(ds_type_queue, actionQueue)) {
	actionQueue = ds_queue_create();
}

alarm[0] = -1;
alarm[1] = -1;

speaker = noone;
speakerX = undefined;
speakerY = undefined;

currentFont = tbyDefaultFont;

maxWidth = tbyDefaultMaxWidth;
maxLines = tbyDefaultLineAmount;

draw_set_font(currentFont);
lineHeight = string_height(ord("W"));

currentWidth = maxWidth;
currentLines = maxLines;

standardWait = tbyWaitAfterEachChar;

sound = tbyDefaultSpeechSound;

//coordinates
mx = 0;
my = 0;
positionUpdate = undefined;

//Text instance coordinates
currentTextInstance = noone;

running = false;

globalPause = 0;

screenW = max(room_width,  display_get_gui_width());
screenH = max(room_height, display_get_gui_height());