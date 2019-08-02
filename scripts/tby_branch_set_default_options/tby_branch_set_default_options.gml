/// @desc Sets the OptionsMap of a TbyBranch to all the default options.
/// @param branchName
var branchName = argument0;

tby_branch_set_option(branchName, TbyOption.SetSkin,          tby_default_skin);
tby_branch_set_option(branchName, TbyOption.SetInstance,      noone);
tby_branch_set_option(branchName, TbyOption.SetCallback,      -1);
tby_branch_set_option(branchName, TbyOption.SetPlacement,     TbyPlacement.Auto);
tby_branch_set_option(branchName, TbyOption.SetWaveSize,      SCRIBBLE_DEFAULT_WAVE_SIZE);
tby_branch_set_option(branchName, TbyOption.SetWaveFrequency, SCRIBBLE_DEFAULT_WAVE_FREQUENCY);
tby_branch_set_option(branchName, TbyOption.SetWaveSpeed,     SCRIBBLE_DEFAULT_WAVE_SPEED);
tby_branch_set_option(branchName, TbyOption.SetShakeSize,     SCRIBBLE_DEFAULT_SHAKE_SIZE);
tby_branch_set_option(branchName, TbyOption.SetShakeSpeed,    SCRIBBLE_DEFAULT_SHAKE_SPEED);
tby_branch_set_option(branchName, TbyOption.SetRainbowWeight, SCRIBBLE_DEFAULT_RAINBOW_WEIGHT);
tby_branch_set_option(branchName, TbyOption.SetRainbowSpeed, SCRIBBLE_DEFAULT_RAINBOW_SPEED);
