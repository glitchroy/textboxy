state_machine_init();
state_create("Init", st_textbox_init)
state_create("QueuedUp", st_textbox_queued_up)
state_create("Writing", st_textbox_writing)
state_create("Waiting", st_textbox_waiting)
state_create("Inactive", st_textbox_inactive)
state_create("Finished", st_textbox_finished)
state_init("Init")
