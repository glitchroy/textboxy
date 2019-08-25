/// @desc Sets the ConfigMap of a TbyBranch to all the default configs.
/// @param _branch_name
var _branch_name = argument0;

tby_branch_config_set(_branch_name, TbyConfig.Skin,          tby_default_skin);
tby_branch_config_set(_branch_name, TbyConfig.Instance,      noone);
tby_branch_config_set(_branch_name, TbyConfig.Callback,      -1);
tby_branch_config_set(_branch_name, TbyConfig.Placement,     TbyPlacement.Auto);
tby_branch_config_set(_branch_name, TbyConfig.WaveSize,      SCRIBBLE_DEFAULT_WAVE_SIZE);
tby_branch_config_set(_branch_name, TbyConfig.WaveFrequency, SCRIBBLE_DEFAULT_WAVE_FREQUENCY);
tby_branch_config_set(_branch_name, TbyConfig.WaveSpeed,     SCRIBBLE_DEFAULT_WAVE_SPEED);
tby_branch_config_set(_branch_name, TbyConfig.ShakeSize,     SCRIBBLE_DEFAULT_SHAKE_SIZE);
tby_branch_config_set(_branch_name, TbyConfig.ShakeSpeed,    SCRIBBLE_DEFAULT_SHAKE_SPEED);
tby_branch_config_set(_branch_name, TbyConfig.RainbowWeight, SCRIBBLE_DEFAULT_RAINBOW_WEIGHT);
tby_branch_config_set(_branch_name, TbyConfig.RainbowSpeed,  SCRIBBLE_DEFAULT_RAINBOW_SPEED);
