type = undefined

tby_state_machine_init();

tby_state_create("Init", tby_state_textbox_init)
tby_state_create("Writing", tby_state_textbox_writing)
tby_state_create("Waiting", tby_state_textbox_waiting)
tby_state_create("Finished", tby_state_textbox_finished)
tby_state_create("Vanishing", tby_state_textbox_vanishing)

tby_state_init("Init")