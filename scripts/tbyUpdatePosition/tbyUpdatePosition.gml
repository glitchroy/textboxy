///@function tbyUpdatePosition(x, y)
///@param x
///@param y

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
	
	if (instance_exists(currentTextInstance)) {
		with (currentTextInstance) {
			x = xx;
			y = yy;
		}
	}
}