/// @desc Sets the config_map of a TbyBranch to all the default configs.
/// @param _branch
var _branch/*:TbyBranch*/ = argument0;

var _config/*:TbyConfig*/ = _branch[TbyBranch.config_array];

_config[@TbyConfig.Skin]          = tby_default_skin;
_config[@TbyConfig.Instance]      = id;
_config[@TbyConfig.Callback]      = -1;
_config[@TbyConfig.Placement]     = TbyPlacement.Auto;
_config[@TbyConfig.Sound]         = tby_sound_default_speech;
_config[@TbyConfig.SoundPitch]    = tby_sound_default_pitch_range;
_config[@TbyConfig.WaveSize]      = tby_default_wave_size;
_config[@TbyConfig.WaveFrequency] = tby_default_wave_frequency;
_config[@TbyConfig.WaveSpeed]     = tby_default_wave_speed;
_config[@TbyConfig.ShakeSize]     = tby_default_shake_size;
_config[@TbyConfig.ShakeSpeed]    = tby_default_shake_speed;
_config[@TbyConfig.RainbowWeight] = tby_default_rainbow_weight;
_config[@TbyConfig.RainbowSpeed]  = tby_default_rainbow_speed;
