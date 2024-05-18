# Makefile for Constraints - SV Lab05

# SIMULATOR = Questa for Mentor's Questasim
# SIMULATOR = VCS for Synopsys's VCS

SIMULATOR = VCS

help:
	@echo =================================================================================
	@echo " USAGE   	--  make target                             				"
	@echo " clean   	=>  clean the earlier log and intermediate files.       	"
	@echo " run_sim 	=>  compile & run the simulation in batch mode.        		"
	@echo " run_test	=>  clean, compile & run the simulation in batch mode.		" 
	@echo =================================================================================
	
clean : clean_$(SIMULATOR)
run_sim : run_sim_$(SIMULATOR)
run_test : run_test_$(SIMULATOR)

# ---- Start of Definitions for Mentor's Questa Specific Targets -----#

run_test_Questa: clean_Questa run_sim_Questa

run_sim_Questa: 
	qverilog ../tb/test_random.sv 

clean_Questa:
	rm -rf transcript* *log* work *.wlf modelsim.ini dff 
	clear 
	
# ---- End of Definitions for Mentor's Questa Specific Targets -----#	

# ---- Start of Definitions for Synopsys VCS Specific Targets -----#

run_test_VCS: clean_VCS run_sim_VCS

run_sim_VCS: 
	vcs -l comp.log -sverilog ../tb/test_random.sv 
	./simv -l vcs.log +ntb_random_seed_automatic

clean_VCS:
	rm -rf simv* csrc* *.tmp *.vpd *.vdb *.key *.log *hdrs.h
	clear 
	
# ---- End of Definitions for Synopsys VCS Specific Targets -----#	
