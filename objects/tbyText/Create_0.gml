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
textCounter = 0;

font = undefined;
lineHeight = undefined;

wait = tbyWaitAfterEachChar;

messageSound = undefined;

running = false;
finished = false;

currentColor = tbyDefaultColor;
currentJitter = false;
currentFont = font;