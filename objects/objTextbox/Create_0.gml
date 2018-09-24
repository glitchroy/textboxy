state_machine_init();
state_create("Init", tby_st_tb_init)
state_create("Writing", tby_st_tb_writing)
state_create("Waiting", tby_st_tb_waiting)
state_create("Inactive", tby_st_tb_inactive)
state_create("Finished", tby_st_tb_finished)
state_init("Init")
