ccGrid = -1;

tbySingleton;
/*
This object handles drawing of text, including
control codes, speed and the typewriter effect
*/
image_speed = tbyPauseSpriteSpeed;

width = undefined;
height = undefined;

cleanText = undefined;
dirtyText = undefined;
typewriterText = "";
textCounter = 1;

font = undefined;

wait = tbyDefaultWaitPerChar;

running = false;
finished = false;

currentColor = c_white;
currentJitter = false;
currentFont = font;