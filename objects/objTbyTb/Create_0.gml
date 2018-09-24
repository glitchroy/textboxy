tby_state_machine_init();
tby_state_create("Init", tby_st_tb_init)
tby_state_create("Writing", tby_st_tb_writing)
tby_state_create("Waiting", tby_st_tb_waiting)
tby_state_create("Inactive", tby_st_tb_inactive)
tby_state_create("Finished", tby_st_tb_finished)
tby_state_init("Init")
