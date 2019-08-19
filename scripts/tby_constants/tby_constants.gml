/// @desc Describes internal macros and enums. Changes in these macros can occur at any update.

/*
    Changes in these macros can occur at any update.
    Only change if you know what you are doing. 
*/

#macro tby_version "1.0.0-pre.9"

/* Shortcut macros */
#macro tby_singleton if (instance_number(object_index)>1) {instance_destroy();}
#macro tby_tile_size global.tby_skin_tile_size
#macro tby_arrlen array_length_1d

/* Internal objects */
#macro tby_object_manager objTby
#macro tby_object_textbox objTbyTextbox

#macro tby_box_lines_per_tb 2
#macro tby_box_horz_padding floor(tby_game_width/8)

enum TbyDim {
    x,
    y,
    width,
    height,
    sizeof
}

enum TbyType {
    Normal, //normal textbox
    Bubble, //bubble textbox
    Choice, //choice
    ChoiceResult, // action only if choice matches
    Config, //branch options
    Wait, //pause execution
    Batch, //multiple input
    Terminate, //force branch exit
    Label, // denote jumping point
    GoTo // jump to label
}

enum TbySkin {
    Frame,
    Bubble,
    Pause,
    Arrow
}

enum TbyFrame {
    TopLeft, TopMid, TopRight,
    MidLeft, Mid, MidRight,
    BotLeft, BotMid, BotRight
}

enum TbyConfig {
    SetSkin, // array
    SetInstance, // instance_id or noone
    SetCallback, // real
    SetPlacement, // enum (TbyPlacement)
    
    // Scribble options
    SetWaveSize,
    SetWaveFrequency,
    SetWaveSpeed,
    SetShakeSize,
    SetShakeSpeed,
    SetRainbowWeight,
    SetRainbowSpeed
}

enum TbyListMeta {
    IdentifierString,
    Pointer,
    HasBeenAdvanced
}

// If no size is given, use global size (aka this)
enum TbyPlacement {
    Top,
    Middle,
    Bottom,
    Auto
}

enum TbyBranch {
    MessageList,
    LabelMap,
    ConfigMap
}

enum TbyTooltip {
    Text,
    DrawBubbleSprite
}