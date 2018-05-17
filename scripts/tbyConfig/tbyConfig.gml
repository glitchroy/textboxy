#region Common config options you may want to modifiy

/**** Appearance ****/
// Options concerning sprites,
// dimensions, animation speed and
// fonts
#macro tbyTextboxSprite         sprTextbox //Sprite needs to be square
#macro tbyTileSize              8 // Same as width/height of textboxSprite
#macro tbyDrawPauseSprite       true
#macro tbyPauseSprite           sprTextboxPause //Origin is the bottom edge of the textbox
#macro tbyPauseSpriteSpeed      0.04 //Only applicable for pause sprites with multiple frames
#macro tbyDrawBubbleSprite      true //Whether to draw the "speech indicator" at the bottom
#macro tbyBubbleSprite          sprTextboxBubble
#macro tbyDefaultFont           fontDefault

/**** Technical ****/
// Options concerning functionality
// of technical features
#macro tbyDefaultMaxWidth       200
#macro tbyDefaultLineAmount     4
#macro tbyWaitAfterEachChar     4 //(In steps) Usual amount to wait after each character is drawn
#macro tbyWaitPerWaitChar       (room_speed/4) //How many steps to wait per . character
#macro tbyBoxBottomMargin       0 //(In pixels) Space between origin and bottom edge of the textbox

//If this expression is true, it counts as having advanced the message
#macro tbyPressedConfirm        (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter))

/**** Audio ****/
// Options concerning audio
#macro tbyPlaySpeechSound       true
#macro tbySpeechSound           sndSpeechDefault
#macro tbySpeechPitchChange     random_range(0.8, 1.2) //(Number 0.0-1.0) Pitch modifier to apply to sound
#macro tbySpeechIteration       3 //Play sound every x characters

#macro tbyPlayConfirmSound      true
#macro tbyConfirmSound          sndMsgConfirm

#endregion


#region Not so common options, only change if you know what you are doing

#macro tbyManagerObject         tbyTextboxManager
#macro tbyTextObject            tbyText
// Change this if you have a dedicated layer for manager objects
#macro tbyCreateManagerSnippet  instance_create_depth(0, 0, -10000, tbyTextboxManager)
#macro tbyCreateTextSnippet     instance_create_depth(0, 0, -10001, tbyText) //Needs to be on a higher up (lower depth)

// The format for the defaults is [control_code/additional_data], e.g. [c/red]
// These should all be one character only
#macro tbyControlCodeOpening    "["
#macro tbyControlCodeClosing    "]"
#macro tbyControlCodeDelimiter  "/" 

/* Action scripts */
// These usually change a property of
// the textbox manager, affecting all
// messages that follow
enum TbyAction {
    SetSpeaker  = tbyActionSetSpeaker,
    SetMaxWidth = tbyActionSetMaxWidth,
    SetMaxLines = tbyActionSetMaxLines,
    SetOrigin   = tbyActionSetOrigin,
    SetPosition = tbyActionSetPosition,
    ShowString  = tbyActionShowString,
    SetSpeed    = tbyActionSetSpeed,
    SetPause    = tbyActionSetPause,
    SetFont     = tbyActionSetFont
}

/*
Every string is split up into characters
and stored in a ds_grid.
Every character has data regarding every
control code.
They take the following form:
+----------+---+---+---+---+---+---+---+
|++++++++++| T | e | s | t | i | n | g |
+----------+---+---+---+---+---+---+---+
|Color     | 1 | 1 | 1 | 1 | 2 | 2 | 2 |
+----------+---+---+---+---+---+---+---+
|WaitFrames| 4 | 4 | 4 | 4 | 9 | 4 | 4 |
+----------+---+---+---+---+---+---+---+
|Jittery?  | f | f | t | t | t | t | t |
+----------+---+---+---+---+---+---+---+
|...       |   |   |   |   |   |   |   |
+----------+---+---+---+---+---+---+---+
*/

// Control codes
enum TbyCode {
	Reset, //Resets needs to be on position 0
	Color,
	Wait,
	Jittery,
	Skip,
	_SIZE //This needs to be last
}

#macro tbyDefaultColor          c_white
#macro tbyColorNames [ "white", c_white, "red", c_red, "orange", c_orange, "yellow", c_yellow, "green", c_green, "aqua", c_aqua, "blue", c_blue, "purple", c_purple]

// They keys should all be ony character only
#macro tbyControlIdentifiers ["r", TbyCode.Reset, "c", TbyCode.Color, ".", TbyCode.Wait, "j", TbyCode.Jittery, "^", TbyCode.Skip]

#endregion


#region Changes here are not intended and need manual configuration

// Frame indices for message sprite 9slice
enum TbySliceIndex {
	TopLeft, TopMiddle, TopRight,
	MiddleLeft, Middle, MiddleRight,
	BottomLeft, BottomMiddle, BottomRight
}

// Indices for the positionUpdate data
enum TbyPositionUpdate {
	Type,
	X,
	Y
}

// Types of the positionUpdate data
enum TbyPositionUpdateType {
	TopLeft,
	Origin
}

/*  Helper stuff */
// Ensures that only one of these objects can exist at the same time
#macro tbySingleton             if (instance_number(object_index)>1) {instance_destroy();}

//Only to be used in the tbyTextboxManager object
#macro tbyManagerSetup          event_user(0)
#macro tbyManagerStart          event_user(1)
#macro tbyManagerNextAction     event_user(2)

//Only to be used in the tbyText object
#macro tbyTextStart             event_user(0)

#endregion