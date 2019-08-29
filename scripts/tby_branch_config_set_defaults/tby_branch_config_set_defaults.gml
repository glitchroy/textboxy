/// @desc Sets the ConfigMap of a TbyBranch to all the default configs.
/// @param _branch_name
var _branch_name = argument0;

tby_branch_config_set(_branch_name, TbyConfig.Skin,          tby_default_skin);
tby_branch_config_set(_branch_name, TbyConfig.Instance,      noone);
tby_branch_config_set(_branch_name, TbyConfig.Callback,      -1);
tby_branch_config_set(_branch_name, TbyConfig.Placement,     TbyPlacement.Auto);
tby_branch_config_set(_branch_name, TbyConfig.Sound,         tby_sound_default_speech);
tby_branch_config_set(_branch_name, TbyConfig.SoundPitch,    tby_sound_default_pitch_range);

tby_branch_config_set(_branch_name, TbyConfig.WaveSize,      tby_default_wave_size);
tby_branch_config_set(_branch_name, TbyConfig.WaveFrequency, tby_default_wave_frequency);
tby_branch_config_set(_branch_name, TbyConfig.WaveSpeed,     tby_default_wave_speed);
tby_branch_config_set(_branch_name, TbyConfig.ShakeSize,     tby_default_shake_size);
tby_branch_config_set(_branch_name, TbyConfig.ShakeSpeed,    tby_default_shake_speed);
tby_branch_config_set(_branch_name, TbyConfig.RainbowWeight, tby_default_rainbow_weight);
tby_branch_config_set(_branch_name, TbyConfig.RainbowSpeed,  tby_default_rainbow_speed);
