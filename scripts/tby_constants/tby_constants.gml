/*
    Changes in these macros can occur at any update.
    Only change if you know what you are doing. 
*/

#macro tby_version "1.0.0-pre.14"

/* Shortcut macros */
#macro tby_singleton if (instance_number(object_index)>1) \
                        {instance_destroy();}
#macro tby_arrlen array_length_1d

/* Internal objects */
#macro tby_object_manager objTby

#macro tby_box_horz_padding floor(tby_game_width/8)

enum TbyType {
    Box    = 100,
    Bubble = 200,
    Choice = 300
}

// Internal commands typically wrapped in a TbyBranch script
enum TbyCmd {
    Config      = 400,
    Pause       = 500,
    Exit        = 600,
    Label       = 700,
    GoTo        = 800,
    SetVar      = 900,
    SetGlobal   = 1000,
    Conditional = 1100
}

enum TbySkin {
    Frame,
    Bubble,
    Pause,
    Arrow,
    TileSize
}

enum TbyCondition {
    Equals,
    BiggerThan,
    SmallerThan,
    NotEquals
}

enum TbyConfig {
    Skin, // array
    Instance, // instance_id or noone
    Callback, // real
    Placement, // enum (TbyPlacement)
    Sound, // number (sound asset)
    SoundPitch, // real
    
    // Scribble options
    WaveSize,
    WaveFrequency,
    WaveSpeed,
    ShakeSize,
    ShakeSpeed,
    RainbowWeight,
    RainbowSpeed,
    sizeof
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

enum TbyPlacement {
    Top,
    Middle,
    Bottom,
    Auto
}


/* Types */

enum TbyBranch {
    message_list,
    label_map,
    config_array,
    destroy_on_finish,
    sizeof
}

enum TbyDim {
    x_content,
    y_content,
    x1,
    y1,
    x2,
    y2,
    sizeof
}
