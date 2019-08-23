/// @desc Describes internal macros and enums. Changes in these macros can occur at any update.

/*
    Changes in these macros can occur at any update.
    Only change if you know what you are doing. 
*/

#macro tby_version "1.0.0-pre.11"

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
    Normal = 100,
    Bubble = 200,
    Choice = 300
}

// Internal commands typically wrapped in a TbyBranch script
enum TbyCmd {
    Config    = 400,
    Wait      = 500,
    Exit      = 600,
    Label     = 700,
    GoTo      = 800,
    SetVar    = 900,
    SetGlobal = 1000,
    Conditional = 1100
    //TODO: Add conditional to branch_handle_entry to compute on runtime
}

enum TbySkin {
    Frame,
    Bubble,
    Pause,
    Arrow
}

enum TbyCondition {
    Equals,
    BiggerThan,
    SmallerThan,
    NotEquals
}

enum TbyFrame {
    TopLeft, TopMid, TopRight,
    MidLeft, Mid, MidRight,
    BotLeft, BotMid, BotRight
}

enum TbyConfig {
    Skin, // array
    Instance, // instance_id or noone
    Callback, // real
    Placement, // enum (TbyPlacement)
    
    // Scribble options
    WaveSize,
    WaveFrequency,
    WaveSpeed,
    ShakeSize,
    ShakeSpeed,
    RainbowWeight,
    RainbowSpeed
}

enum TbyListMeta {
    IdentifierString,
    Pointer,
    HasBeenAdvanced
}

enum TbyPointerMeta {
    IdentifierString,
    Scope,
    VariableName
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