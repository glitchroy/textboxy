tby_init();

var c = new TbyChain([
	new TbyChunk().add.box("This is cu[delay]rious!"),
	new TbyChunk().add.label("x"),
	new TbyChunk().add.bubble("[pin_center][shake]This is amazing![/][pin_left]And totally a work in progress. Check out [c_orange]@glitchroy[/] on Twitter for updates!", instance_find(obj_talker, 0)),
	new TbyChunk().add.execute(tby_error, "test 123"),
	new TbyChunk().add.config("instance", noone),
    new TbyChunk().add.box("123", "top"),
    new TbyChunk().add.pause(1),
    new TbyChunk().add.goto("x"),
    new TbyChunk().add.box("hiu", "top")
]);

var d = new TbyChain([
    new TbyChunk().add.box("tkkkkkkkkkkkkkkkkkko", "middle"),
    new TbyChunk().add.bubble("uizuiz", instance_find(obj_talker, 0))
]);

var _profile = {
	speed: 3
};

var e = new TbyChain([
	new TbyChunk().add.profile(_profile),
	new TbyChunk().add.label("loop1"),
	new TbyChunk().add.box("let's test your mouse position!"),
	new TbyChunk().add.branch(function() { return mouse_x > tby_game_width/2 },
	[
		new TbyChunk().add.box("your mouse is right"),
	],
	[
		new TbyChunk().add.box("your mouse is left")
	]
	),
	new TbyChunk().add.box("anyways..."),
	new TbyChunk().add.goto("loop1")
])

c.run();
//e.run();

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
}
debug_resize(window_scale, window_scale_max);