tbySingleton;
/*
This instance handles drawing of text, including
control codes, speed and the typewriter effect
*/
cleanText = undefined;
dirtyText = undefined;
typewriterText = "";
textCounter = 1;

ccGrid = undefined
font = undefined;

defaultWait = tbyDefaultWaitPerChar;

running = false;

currentWait = defaultWait;
currentColor = c_white;
currentJitter = false;
currentFont = font;