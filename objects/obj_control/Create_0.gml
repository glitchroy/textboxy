tby_init();

var _profile = {
	text: {
		speed: 3
	}
};

var e = new TbyChain([
	//tby_chunk.profile(_profile),
	tby.box("You encounter a strange fellow with an even stranger request..."),
	tby.label("loop1"),
	tby.config("bubble.instance", instance_find(obj_talker, 0)),
	tby.bubble("Let's test your [wheel]mouse position[/wheel]!"),
	tby.branch(function() { return mouse_x > room_width/2; },
	[
		tby.bubble("Your mouse is on the [c_orange]right[/]."),
	],
	[
		tby.bubble("Your mouse is on the [c_orange]left[/]."),
		tby.pause(1),
		tby.bubble("[shake]I waited a bit![/shake]")
	]
	),
	tby.bubble("let's try again..."),
	tby.goto("loop1")
]).run();

window_scale = 2;
window_scale_max = 4;
debug_resize = function(_scale, _scale_max) {
	var _window_width = tby_game_width * _scale;
	var _window_height = tby_game_height * _scale;
	
	//Change window size and center it
	window_set_rectangle(
	    (display_get_width() - _window_width) * 0.5, 
	    (display_get_height() - _window_height) * 0.5, 
	    _window_width,
	    _window_height
	);
	//Set GUI to always be as big
	display_set_gui_size(_window_width/_scale, _window_height/_scale);
	    
	//Set AppSurface to window size 1:1 for subpixels
	surface_resize(application_surface, _window_width, _window_height);
};
debug_resize(window_scale, window_scale_max);