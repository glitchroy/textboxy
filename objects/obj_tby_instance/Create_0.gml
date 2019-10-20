_tby_state_machine_init();

_tby_state_create("Active",          _tby_state_instance_active);
_tby_state_create("Waiting",         _tby_state_instance_waiting);
_tby_state_create("Finished",        _tby_state_instance_finished);
_tby_state_create("Vanishing",       _tby_state_instance_vanishing);

_tby_state_init("Active");