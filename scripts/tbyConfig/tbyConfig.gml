#region Common config options you may want to modifiy

//Appearance
#macro tbyTextboxSprite		sprTextbox
#macro tbyPauseSprite		sprTextboxPause //ideal height: 2x tileSize
#macro tbyBubbleSprite		sprTextboxBubble
#macro tbyTileSize			8
#macro tbyDrawPauseSymbol	true
#macro tbyDefaultFont		fontDefault

//Technical
#macro tbyDefaultMaxWidth		200
#macro tbyDefaultLineAmount		4
#macro tbyDefaultLineHeight		10
#macro tbyDefaultCharsPerStep	2 //0.5 etc allowed too


//Keys that the message should listen to
#macro tbyInputKey			keyboard_check(vk_space) || keyboard_check(vk_enter)

#endregion


#region Not so common options, only change if you know what you are doing

#macro tbyManagerObject tbyTextboxManager
#macro tbyTextObject	tbyText
// Change this if you have a dedicated layer for manager objects
#macro tbyCreateManagerSnippet	instance_create_depth(0, 0, -10000, tbyTextboxManager)
#macro tbyCreateTextSnippet		instance_create_depth(0, 0, -10001, tbyText)

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
	ShowString  = tbyActionShowString
}

enum TbyControlCode {
	Jittery
}

#macro tbySingleton if (instance_number(object_index)>1) {instance_destroy();}

//Only to be used in the tbyTextboxManager object
#macro tbyManagerStart event_user(0);
#macro tbyManagerNextAction event_user(1);
#macro tbyTextStart event_user(0);

#endregion