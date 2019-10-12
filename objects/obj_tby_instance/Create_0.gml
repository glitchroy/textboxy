tby_state_machine_init();

tby_state_create("Active",          tby_state_instance_active);
tby_state_create("Waiting",         tby_state_instance_waiting);
tby_state_create("Finished",        tby_state_instance_finished);
tby_state_create("Vanishing",       tby_state_instance_vanishing);

tby_state_init("Active");