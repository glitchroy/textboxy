#region Common config options you may want to modifiy

//Appearance
#macro tbyTextboxSprite		sprTextbox
#macro tbyPauseSprite		sprTextboxPause //ideal height: 2x tileSize
#macro tbyPauseSpriteSpeed	0.04
#macro tbyBubbleSprite		sprTextboxBubble
#macro tbyTileSize			8
#macro tbyDrawPauseSymbol	true
#macro tbyDefaultFont		fontDefault

//Technical
#macro tbyDefaultMaxWidth		200
#macro tbyDefaultLineAmount		4
#macro tbyLineHeight			10
#macro tbyDefaultWaitEachChar	4 //in steps
#macro tbyWaitPerWaitChar		(room_speed/4) //how many steps to wait per . character

//Audio
#macro tbyPlaySpeechSound		true
#macro tbySpeechSound			sndSpeechDefault
#macro tbySpeechPitchChange		random_range(0.8, 1.2)
#macro tbySpeechIteration		3 //play sound every x characters
#macro tbyPlayConfirmSound		true
#macro tbyConfirmSound			sndMsgConfirm


//Keys that the message should listen to
#macro tbyInputKey			(keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter))

#endregion


#region Not so common options, only change if you know what you are doing

#macro tbyManagerObject tbyTextboxManager
#macro tbyTextObject	tbyText
// Change this if you have a dedicated layer for manager objects
#macro tbyCreateManagerSnippet	instance_create_depth(0, 0, -10000, tbyTextboxManager)
#macro tbyCreateTextSnippet		instance_create_depth(0, 0, -10001, tbyText)

// These should all be one character only
// The format for the defaults is [control_code/additional_data]
#macro tbyControlCodeOpening	"["
#macro tbyControlCodeClosing	"]"
#macro tbyControlCodeDelimiter	"/" 

#macro tbyDefaultColor c_white
#macro tbyColorNames [ "white", c_white, "red", c_red, "orange", c_orange, "yellow", c_yellow, "green", c_green, "aqua", c_aqua, "blue", c_blue, "purple", c_purple]

enum TbyFont {
	Default = tbyDefaultFont
}

#endregion


#region Don't change these

enum TbySliceIndex {
	TopLeft, TopMiddle, TopRight,
	MiddleLeft, Middle, MiddleRight,
	BottomLeft, BottomMiddle, BottomRight
}

enum TbyAction {
	SetSpeaker  = tbyActionSetSpeaker,
	SetMaxWidth = tbyActionSetMaxWidth,
	SetMaxLines = tbyActionSetMaxLines,
	SetOrigin   = tbyActionSetOrigin,
	ShowString  = tbyActionShowString,
	SetSpeed	= tbyActionSetSpeed,
	SetPause	= tbyActionSetPause
}

/*
Every string index has a control code payload.
They take the following form:
+----------+---+---+---+---+---+---+---+
|++++++++++| T | e | s | t | i | n | g |
+----------+---+---+---+---+---+---+---+
|Color     | 1 | 1 | 1 | 1 | 2 | 2 | 2 |
+----------+---+---+---+---+---+---+---+
|WaitFrames| 0 | 0 | 0 | 0 | 0 | 0 | 3 |
+----------+---+---+---+---+---+---+---+
|Jittery?  | f | f | t | t | t | t | t |
+----------+---+---+---+---+---+---+---+
|...       |   |   |   |   |   |   |   |
+----------+---+---+---+---+---+---+---+
*/

enum TbyCode {
	Reset, //this needs to be on 0 position
	Color,
	Font,
	Wait,
	Jittery,
	Skip,
	_SIZE
}

// They keys should all be ony character only
#macro tbyControlIdentifiers ["r", TbyCode.Reset, "c", TbyCode.Color, "f", TbyCode.Font, ".", TbyCode.Wait, "j", TbyCode.Jittery, "^", TbyCode.Skip ]

/*  Helper stuff */
#macro tbySingleton if (instance_number(object_index)>1) {instance_destroy();}

//Only to be used in the tbyTextboxManager object
#macro tbyManagerStart event_user(0)
#macro tbyManagerNextAction event_user(1)

//Only to be used in the tbyText object
#macro tbyTextStart event_user(0)

#endregion