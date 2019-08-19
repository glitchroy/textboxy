/// @desc Sets the ConfigMap of a TbyBranch to all the default configs.
/// @param _branch_name
var _branch_name = argument0;

tby_branch_set_config(_branch_name, TbyConfig.SetSkin,          tby_default_skin);
tby_branch_set_config(_branch_name, TbyConfig.SetInstance,      noone);
tby_branch_set_config(_branch_name, TbyConfig.SetCallback,      -1);
tby_branch_set_config(_branch_name, TbyConfig.SetPlacement,     TbyPlacement.Auto);
tby_branch_set_config(_branch_name, TbyConfig.SetWaveSize,      SCRIBBLE_DEFAULT_WAVE_SIZE);
tby_branch_set_config(_branch_name, TbyConfig.SetWaveFrequency, SCRIBBLE_DEFAULT_WAVE_FREQUENCY);
tby_branch_set_config(_branch_name, TbyConfig.SetWaveSpeed,     SCRIBBLE_DEFAULT_WAVE_SPEED);
tby_branch_set_config(_branch_name, TbyConfig.SetShakeSize,     SCRIBBLE_DEFAULT_SHAKE_SIZE);
tby_branch_set_config(_branch_name, TbyConfig.SetShakeSpeed,    SCRIBBLE_DEFAULT_SHAKE_SPEED);
tby_branch_set_config(_branch_name, TbyConfig.SetRainbowWeight, SCRIBBLE_DEFAULT_RAINBOW_WEIGHT);
tby_branch_set_config(_branch_name, TbyConfig.SetRainbowSpeed,  SCRIBBLE_DEFAULT_RAINBOW_SPEED);
