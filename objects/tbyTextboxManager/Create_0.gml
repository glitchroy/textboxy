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

maxWidth = tbyDefaultMaxWidth;
maxLines = tbyDefaultLineAmount;
lineHeight = tbyLineHeight;

currentWidth = maxWidth;
currentLines = maxLines;

currentFont = tbyDefaultFont;

standardWait = tbyDefaultWaitPerChar;

//Origin coordinates
ox = 0;
oy = 0;

//Text instance coordinates
tx = undefined;
ty = undefined;
currentText = noone;

running = false;

globalPause = 0;