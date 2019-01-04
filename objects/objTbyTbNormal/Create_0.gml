tby_state_machine_init();
tby_state_create("Init", tby_st_tb_init)
tby_state_create("Writing", tby_st_tb_writing)
tby_state_create("Waiting", tby_st_tb_waiting)
tby_state_create("Finished", tby_st_tb_finished)
tby_state_create("Vanishing", tby_st_tb_vanishing)
tby_state_init("Init")