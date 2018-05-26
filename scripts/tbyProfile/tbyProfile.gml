///@function tbyProfile(profile)
///@desc Applies a profile
///@param profile

var profile = argument0;

if (is_array(profile) == false) {
	tbyLog("Invalid profile found")
	return -1;
}

if (profile[TbyProfileData.Speaker] != undefined) {
	tbyAddAction(TbyAction.SetSpeaker, profile[TbyProfileData.Speaker]);
}
if (profile[TbyProfileData.Sound] != undefined) {
	tbyAddAction(TbyAction.SetSound, profile[TbyProfileData.Sound]);
}
if (profile[TbyProfileData.Speed] != undefined) {
	tbyAddAction(TbyAction.SetSpeed, profile[TbyProfileData.Speed]);
}