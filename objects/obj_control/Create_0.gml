tby_init();

var c = new TbyChain([
	new TbyChunk().add.bubble("hi du", instance_find(obj_talker, 0)),
	new TbyChunk().add.box("testo texto", "top"),
	new TbyChunk().add.config("instance", noone),
    new TbyChunk().add.box("123", "top"),
    new TbyChunk().add.pause(1),
    new TbyChunk().add.box("hiu", "top"),
]);

var d = new TbyChain([
    new TbyChunk().add.box("tkkkkkkkkkkkkkkkkkko", "middle"),
]);

//c.run();
c.run();
