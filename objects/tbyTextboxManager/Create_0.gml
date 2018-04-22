/*
This object keeps track of the action queue and timing
events. For the sake of this library, this is a seperate object,
but you could also handle this in a generic UI manager event.

This object also handles drawing of all message boxes
spawning of text instances for drawing text
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
lineHeight = tbyDefaultLineHeight;

currentAction = undefined;
currentWidth = maxWidth;
currentLines = maxLines;

currentFont = tbyDefaultFont;

//Origin coordinates
ox = 0;
oy = 0;

//Text instance coordinates
tx = undefined;
ty = undefined;
currentText = noone;

running = false;