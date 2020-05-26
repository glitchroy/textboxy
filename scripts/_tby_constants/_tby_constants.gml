function _tby_constants() {
	/*
	    Changes in these macros can occur at any update.
	    Only change if you know what you are doing. 
	*/

#macro tby_version "1.0.0-pre.17"

	/* Shortcut macros */
#macro tby_singleton if (instance_number(object_index)>1) \
	                     {instance_destroy();}
#macro tby_arrlen array_length_1d

	/* Internal objects */
#macro tby_object_manager obj_tby
#macro tby_object_instance obj_tby_instance

	/* Internal commands */
	enum TbyType {
	    Box    = 100,
	    Bubble = 200,
	    Choice = 300
	}
	enum TbyCmd {
	    Config      = 400,
	    Pause       = 500,
	    Exit        = 600,
	    Label       = 700,
	    GoTo        = 800,
	    SetVar      = 900,
	    SetGlobal   = 1000,
	    Conditional = 1100,
	    Script      = 1200,
	    Select      = 1300
	}

	/* Enums */
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

	enum TbyPlacement {
	    Top,
	    Middle,
	    Bottom,
	    Auto
	}

	/* Meta */
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

	/* Types */
	enum TbyBranch {
	    message_list,
	    label_map,
	    config_array,
	    destroy_on_finish,
	    scribble_cache_group,
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



}
