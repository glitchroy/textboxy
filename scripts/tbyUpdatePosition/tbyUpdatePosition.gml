///@function tbyUpdatePosition(x, y)
///@desc Updates the position in the textbox manager and text instance
///@param x
///@param y

// Takes values from x, y or array
var xx, yy;
if (argument_count == 1 && is_array(argument[0])) {
	var a = argument[0];
	xx = a[0];
	yy = a[1];
} else {
	xx = argument[0];
	yy = argument[1];

}

with (tbyM()) {
	mx = xx;
	my = yy;
	
	//also update text instance
	if (instance_exists(currentTextInstance)) {
		with (currentTextInstance) {
			x = xx;
			y = yy;
		}
	}
}