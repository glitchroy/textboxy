# textboxy
I just modified some parts of the script, and did this function. Maybe this would help you with a new idea

# Explanation

The new function basically modify the bubble sprite using global variables who was setup in the `tbyConfig` file

Works something like this:
```gml
//on tbyConfig() file
...
#macro tbyTextboxSprite         global.skin // Sprite needs to be square
...
#macro tbyPauseSprite           global.skin_pause // Origin is the bottom edge of the textbox
...
#macro tbyBubbleSprite          global.skin_bubble
...
enum TbyAction {
    SetSpeaker  = tbyActionSetSpeaker,
    SetMaxWidth = tbyActionSetMaxWidth,
    SetMaxLines = tbyActionSetMaxLines,
    SetOrigin   = tbyActionSetOrigin,
    SetPosition = tbyActionSetPosition,
    ShowString  = tbyActionShowString,
    SetSpeed    = tbyActionSetSpeed,
    SetPause    = tbyActionSetPause,
    SetFont     = tbyActionSetFont,
	SetSound    = tbyActionSetSound,
	ChangeBubble= tbyChangeBubble
}
...
```

With that, we're ready to use the function
```gml
var bubble = [spr_SkinA, spr_PauseSkinA, spr_BubbleSkinA]; //This has to be in this order [<primary sprite skin>, <pause sprite>, <bubble sprite>]
tbyAddAction(TbyAction.ChangeBubble, bubble);
tbyAddAction(TbyAction.SetPosition, 100, 100);
tbyAddAction(TbyAction.ShowString, "Hello world!");

bubble = [spr_SkinB, spr_PauseSkinB, spr_BubbleSkinB];
tbyAddAction(TbyAction.ChangeBubble, bubble);
tbyAddAction(TbyAction.SetPosition, 100, 400);
tbyAddAction(TbyAction.ShowString, "Oh... why am i different?!");
tbyStart();
```

This would show a message box with the words "Hello world" at position 100, 100, with speech bubble A sprite, and another message box with the other words with another sprite.

##For the first bubble you'll need to use the function, because the global variables aren't with a sprite