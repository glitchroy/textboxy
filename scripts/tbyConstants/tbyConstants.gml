#region Changes here are not intended and need manual configuration
#macro tbyVersion "0.3.0"

// Frame indices for message sprite 9slice
enum TbySliceIndex {
	TopLeft, TopMiddle, TopRight,
	MiddleLeft, Middle, MiddleRight,
	BottomLeft, BottomMiddle, BottomRight
}

// Indices for the positionUpdate data
enum TbyPositionUpdate {
	Type,
	X,
	Y
}

// Types of the positionUpdate data
enum TbyPositionUpdateType {
	TopLeft,
	Origin
}

// Profile data
enum TbyProfileData {
	Speaker,
	Sound,
	Speed
}

/*  Helper stuff */
// Ensures that only one of these objects can exist at the same time
#macro tbySingleton             if (instance_number(object_index)>1) {instance_destroy();}

// Only to be used in the tbyTextboxManager object
#macro tbyManagerSetup          event_user(0)
#macro tbyManagerStart          event_user(1)
#macro tbyManagerNextAction     event_user(2)
#macro tbyManagerReset          event_user(3)

// Only to be used in the tbyText object
#macro tbyTextStart             event_user(0)

#endregion