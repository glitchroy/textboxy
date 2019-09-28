/// @desc Sets the config_map of a TbyBranch to all the default configs.
/// @param _branch
var _branch = argument0;

var _b/*:TbyBranch*/ = _branch;

tby_branch_config_set(_b, TbyConfig.Skin,          tby_default_skin);
tby_branch_config_set(_b, TbyConfig.Instance,      noone);
tby_branch_config_set(_b, TbyConfig.Callback,      -1);
tby_branch_config_set(_b, TbyConfig.Placement,     TbyPlacement.Auto);
tby_branch_config_set(_b, TbyConfig.Sound,         tby_sound_default_speech);
tby_branch_config_set(_b, TbyConfig.SoundPitch,    tby_sound_default_pitch_range);

tby_branch_config_set(_b, TbyConfig.WaveSize,      tby_default_wave_size);
tby_branch_config_set(_b, TbyConfig.WaveFrequency, tby_default_wave_frequency);
tby_branch_config_set(_b, TbyConfig.WaveSpeed,     tby_default_wave_speed);
tby_branch_config_set(_b, TbyConfig.ShakeSize,     tby_default_shake_size);
tby_branch_config_set(_b, TbyConfig.ShakeSpeed,    tby_default_shake_speed);
tby_branch_config_set(_b, TbyConfig.RainbowWeight, tby_default_rainbow_weight);
tby_branch_config_set(_b, TbyConfig.RainbowSpeed,  tby_default_rainbow_speed);
