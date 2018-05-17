/// @description Create variables

#region Explanation
/* Why do we initialize here and not in Create?
Simple answer: We re-use this script for
tbyReset() purposes.
Since deleting and re-creating the manager would
take until the next step after execution, it's
not an option if the user wants to reset
mid-dialogue. So this is the alternative */
#endregion


// if this is set, start executing
// when reset is finished
delayedStart = false;

actionQueue = ds_queue_create();
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