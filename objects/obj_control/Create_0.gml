tby_init();

var c = new TbyChain([
	new TbyChunk().add.box("tsesto texto", "top"),
	new TbyChunk().add.label("x"),
	new TbyChunk().add.bubble("[shake]hi duuuuuu", instance_find(obj_talker, 0)),
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

d.run();
c.run();
