/*
This object keeps track of the action queue and timing
events. For the sake of this library, this is a seperate object,
but one could also handle this in a generic UI manager event.

This object also handles drawing of all message boxes and
spawning of text instances for drawing the text.
*/

//singleton code - destory this object if it already exists
tbySingleton;

//Create variables
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

standardWait = tbyDefaultWaitEachChar;

//coordinates
tlx = 0;
tly = 0;
positionUpdate = undefined;

//Text instance coordinates
currentTextInstance = noone;

running = false;

globalPause = 0;

screenW = display_get_gui_width();
screenH = display_get_gui_height();