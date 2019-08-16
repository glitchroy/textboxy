/// @desc Sets the OptionsMap of a TbyBranch to all the default options.
/// @param _branch_name
var _branch_name = argument0;

tby_branch_set_option(_branch_name, TbyOption.SetSkin,          tby_default_skin);
tby_branch_set_option(_branch_name, TbyOption.SetInstance,      noone);
tby_branch_set_option(_branch_name, TbyOption.SetCallback,      -1);
tby_branch_set_option(_branch_name, TbyOption.SetPlacement,     TbyPlacement.Auto);
tby_branch_set_option(_branch_name, TbyOption.SetWaveSize,      SCRIBBLE_DEFAULT_WAVE_SIZE);
tby_branch_set_option(_branch_name, TbyOption.SetWaveFrequency, SCRIBBLE_DEFAULT_WAVE_FREQUENCY);
tby_branch_set_option(_branch_name, TbyOption.SetWaveSpeed,     SCRIBBLE_DEFAULT_WAVE_SPEED);
tby_branch_set_option(_branch_name, TbyOption.SetShakeSize,     SCRIBBLE_DEFAULT_SHAKE_SIZE);
tby_branch_set_option(_branch_name, TbyOption.SetShakeSpeed,    SCRIBBLE_DEFAULT_SHAKE_SPEED);
tby_branch_set_option(_branch_name, TbyOption.SetRainbowWeight, SCRIBBLE_DEFAULT_RAINBOW_WEIGHT);
tby_branch_set_option(_branch_name, TbyOption.SetRainbowSpeed,  SCRIBBLE_DEFAULT_RAINBOW_SPEED);
