size = tby_size_create(200, 200, 120)

tby_queue_create("queue1");
tby_queue_use("queue1");
tby_queue_set(TbyOption.SetWave, 10)
tby_queue_set(TbyOption.SetInstance, instance_find(objTest, 0))
tby_queue_add(TbyType.Normal, ["[wave]I will present you a choice!", true, size])
tby_queue_add(TbyType.Choice, 
["What should I do?[ev|wait|0.2]",
["Do this!", "Do that!", "Do the [wave]third thing[]"], size])

tby_queue_create("queue2-0");
tby_queue_use("queue2-0");
tby_queue_set(TbyOption.SetInstance, instance_find(objTest, 0))
tby_queue_add(TbyType.Normal, ["[shake]You did the first thing!", true, size])

tby_queue_create("queue2-1");
tby_queue_use("queue2-1");
tby_queue_set(TbyOption.SetInstance, instance_find(objTest, 0))
tby_queue_add(TbyType.Normal, ["This is the second thing and also I'm big!", true,
             tby_size_create(0, 0, tby_game_width, tby_game_height, 10)])

tby_queue_create("queue2-2");
tby_queue_use("queue2-2");
tby_queue_set(TbyOption.SetInstance, instance_find(objTest, 0))
tby_queue_add(TbyType.Normal,
             ["Third[ev|wait|0.2].[ev|wait|0.2].[ev|wait|0.2].[ev|wait|0.2][rainbow]thing.",
             true, size])
