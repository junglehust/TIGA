set moduleName myaes
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {myaes}
set C_modelType { void 0 }
set C_modelArgList {
	{ ciphertextStrm int 128 regular {fifo 0 volatile }  }
	{ endCiphertextStrm int 1 regular {fifo 0 volatile }  }
	{ cipherkeyStrm int 256 regular {fifo 0 volatile }  }
	{ IVStrm int 128 regular {fifo 0 volatile }  }
	{ plaintextStrm int 128 regular {fifo 1 volatile }  }
	{ endPlaintextStrm int 1 regular {fifo 1 volatile }  }
	{ timeaes int 32 regular {fifo 1 volatile }  }
	{ ComputeWordCnt_loc int 32 regular {fifo 0}  }
	{ ComputeWordCnt_loc_out int 32 regular {fifo 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "ciphertextStrm", "interface" : "fifo", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "endCiphertextStrm", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "cipherkeyStrm", "interface" : "fifo", "bitwidth" : 256, "direction" : "READONLY"} , 
 	{ "Name" : "IVStrm", "interface" : "fifo", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "plaintextStrm", "interface" : "fifo", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "endPlaintextStrm", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "timeaes", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ComputeWordCnt_loc", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ComputeWordCnt_loc_out", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 37
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ start_full_n sc_in sc_logic 1 signal -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ start_out sc_out sc_logic 1 signal -1 } 
	{ start_write sc_out sc_logic 1 signal -1 } 
	{ ciphertextStrm_dout sc_in sc_lv 128 signal 0 } 
	{ ciphertextStrm_empty_n sc_in sc_logic 1 signal 0 } 
	{ ciphertextStrm_read sc_out sc_logic 1 signal 0 } 
	{ endCiphertextStrm_dout sc_in sc_lv 1 signal 1 } 
	{ endCiphertextStrm_empty_n sc_in sc_logic 1 signal 1 } 
	{ endCiphertextStrm_read sc_out sc_logic 1 signal 1 } 
	{ cipherkeyStrm_dout sc_in sc_lv 256 signal 2 } 
	{ cipherkeyStrm_empty_n sc_in sc_logic 1 signal 2 } 
	{ cipherkeyStrm_read sc_out sc_logic 1 signal 2 } 
	{ IVStrm_dout sc_in sc_lv 128 signal 3 } 
	{ IVStrm_empty_n sc_in sc_logic 1 signal 3 } 
	{ IVStrm_read sc_out sc_logic 1 signal 3 } 
	{ plaintextStrm_din sc_out sc_lv 128 signal 4 } 
	{ plaintextStrm_full_n sc_in sc_logic 1 signal 4 } 
	{ plaintextStrm_write sc_out sc_logic 1 signal 4 } 
	{ endPlaintextStrm_din sc_out sc_lv 1 signal 5 } 
	{ endPlaintextStrm_full_n sc_in sc_logic 1 signal 5 } 
	{ endPlaintextStrm_write sc_out sc_logic 1 signal 5 } 
	{ timeaes_din sc_out sc_lv 32 signal 6 } 
	{ timeaes_full_n sc_in sc_logic 1 signal 6 } 
	{ timeaes_write sc_out sc_logic 1 signal 6 } 
	{ ComputeWordCnt_loc_dout sc_in sc_lv 32 signal 7 } 
	{ ComputeWordCnt_loc_empty_n sc_in sc_logic 1 signal 7 } 
	{ ComputeWordCnt_loc_read sc_out sc_logic 1 signal 7 } 
	{ ComputeWordCnt_loc_out_din sc_out sc_lv 32 signal 8 } 
	{ ComputeWordCnt_loc_out_full_n sc_in sc_logic 1 signal 8 } 
	{ ComputeWordCnt_loc_out_write sc_out sc_logic 1 signal 8 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "start_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_full_n", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "start_out", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_out", "role": "default" }} , 
 	{ "name": "start_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_write", "role": "default" }} , 
 	{ "name": "ciphertextStrm_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "ciphertextStrm", "role": "dout" }} , 
 	{ "name": "ciphertextStrm_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ciphertextStrm", "role": "empty_n" }} , 
 	{ "name": "ciphertextStrm_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ciphertextStrm", "role": "read" }} , 
 	{ "name": "endCiphertextStrm_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "endCiphertextStrm", "role": "dout" }} , 
 	{ "name": "endCiphertextStrm_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "endCiphertextStrm", "role": "empty_n" }} , 
 	{ "name": "endCiphertextStrm_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "endCiphertextStrm", "role": "read" }} , 
 	{ "name": "cipherkeyStrm_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "cipherkeyStrm", "role": "dout" }} , 
 	{ "name": "cipherkeyStrm_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cipherkeyStrm", "role": "empty_n" }} , 
 	{ "name": "cipherkeyStrm_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cipherkeyStrm", "role": "read" }} , 
 	{ "name": "IVStrm_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "IVStrm", "role": "dout" }} , 
 	{ "name": "IVStrm_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "IVStrm", "role": "empty_n" }} , 
 	{ "name": "IVStrm_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "IVStrm", "role": "read" }} , 
 	{ "name": "plaintextStrm_din", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "plaintextStrm", "role": "din" }} , 
 	{ "name": "plaintextStrm_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "plaintextStrm", "role": "full_n" }} , 
 	{ "name": "plaintextStrm_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "plaintextStrm", "role": "write" }} , 
 	{ "name": "endPlaintextStrm_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "endPlaintextStrm", "role": "din" }} , 
 	{ "name": "endPlaintextStrm_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "endPlaintextStrm", "role": "full_n" }} , 
 	{ "name": "endPlaintextStrm_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "endPlaintextStrm", "role": "write" }} , 
 	{ "name": "timeaes_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "timeaes", "role": "din" }} , 
 	{ "name": "timeaes_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "timeaes", "role": "full_n" }} , 
 	{ "name": "timeaes_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "timeaes", "role": "write" }} , 
 	{ "name": "ComputeWordCnt_loc_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ComputeWordCnt_loc", "role": "dout" }} , 
 	{ "name": "ComputeWordCnt_loc_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ComputeWordCnt_loc", "role": "empty_n" }} , 
 	{ "name": "ComputeWordCnt_loc_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ComputeWordCnt_loc", "role": "read" }} , 
 	{ "name": "ComputeWordCnt_loc_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ComputeWordCnt_loc_out", "role": "din" }} , 
 	{ "name": "ComputeWordCnt_loc_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ComputeWordCnt_loc_out", "role": "full_n" }} , 
 	{ "name": "ComputeWordCnt_loc_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ComputeWordCnt_loc_out", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "4"],
		"CDFG" : "myaes",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "ciphertextStrm", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "ciphertextStrm_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "endCiphertextStrm", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "1", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "endCiphertextStrm_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "cipherkeyStrm", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "cipherkeyStrm_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "IVStrm", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "IVStrm_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "plaintextStrm", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "plaintextStrm_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "endPlaintextStrm", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "1", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "endPlaintextStrm_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "timeaes", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "timeaes_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ComputeWordCnt_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "ComputeWordCnt_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ComputeWordCnt_loc_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "ComputeWordCnt_loc_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "decipher_0_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_updateKey_fu_289", "Port" : "decipher_0_2"}]},
			{"Name" : "Rcon", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_updateKey_fu_289", "Port" : "Rcon"}]},
			{"Name" : "decipher_0_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_process_r_fu_264", "Port" : "decipher_0_3"}]},
			{"Name" : "decipher_0_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_process_r_fu_264", "Port" : "decipher_0_1"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_process_r_fu_264", "Parent" : "0", "Child" : ["2", "3"],
		"CDFG" : "process_r",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "27", "EstimateLatencyMin" : "27", "EstimateLatencyMax" : "27",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "1",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "p_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read2", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read3", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read4", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read5", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read6", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read7", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read8", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read9", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read10", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read11", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read12", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read13", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read14", "Type" : "None", "Direction" : "I"},
			{"Name" : "ciphertext", "Type" : "None", "Direction" : "I"},
			{"Name" : "decipher_0_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "decipher_0_1", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_process_r_fu_264.decipher_0_3_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_process_r_fu_264.decipher_0_1_U", "Parent" : "1"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_updateKey_fu_289", "Parent" : "0", "Child" : ["5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22"],
		"CDFG" : "updateKey",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "16", "EstimateLatencyMax" : "16",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read2", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read3", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read4", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read5", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read6", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read7", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read8", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read9", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read10", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read11", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read12", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read13", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read14", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read15", "Type" : "None", "Direction" : "I"},
			{"Name" : "cipherkey", "Type" : "None", "Direction" : "I"},
			{"Name" : "decipher_0_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "Rcon", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_updateKey_fu_289.decipher_0_2_U", "Parent" : "4"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_updateKey_fu_289.Rcon_U", "Parent" : "4"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_updateKey_fu_289.mux_164_1_1_1_U172", "Parent" : "4"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_updateKey_fu_289.mux_164_1_1_1_U173", "Parent" : "4"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_updateKey_fu_289.mux_164_1_1_1_U174", "Parent" : "4"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_updateKey_fu_289.mux_164_1_1_1_U175", "Parent" : "4"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_updateKey_fu_289.mux_164_1_1_1_U176", "Parent" : "4"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_updateKey_fu_289.mux_164_1_1_1_U177", "Parent" : "4"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_updateKey_fu_289.mux_164_1_1_1_U178", "Parent" : "4"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_updateKey_fu_289.mux_164_1_1_1_U179", "Parent" : "4"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_updateKey_fu_289.mux_164_128_1_1_U180", "Parent" : "4"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_updateKey_fu_289.mux_164_128_1_1_U181", "Parent" : "4"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_updateKey_fu_289.mux_164_128_1_1_U182", "Parent" : "4"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_updateKey_fu_289.mux_164_128_1_1_U183", "Parent" : "4"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_updateKey_fu_289.mux_164_128_1_1_U184", "Parent" : "4"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_updateKey_fu_289.mux_164_128_1_1_U185", "Parent" : "4"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_updateKey_fu_289.mux_164_128_1_1_U186", "Parent" : "4"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_updateKey_fu_289.mux_164_128_1_1_U187", "Parent" : "4"}]}


set ArgLastReadFirstWriteLatency {
	myaes {
		ciphertextStrm {Type I LastRead 7 FirstWrite -1}
		endCiphertextStrm {Type I LastRead 6 FirstWrite -1}
		cipherkeyStrm {Type I LastRead 4 FirstWrite -1}
		IVStrm {Type I LastRead 4 FirstWrite -1}
		plaintextStrm {Type O LastRead -1 FirstWrite 30}
		endPlaintextStrm {Type O LastRead -1 FirstWrite 3}
		timeaes {Type O LastRead -1 FirstWrite 3}
		ComputeWordCnt_loc {Type I LastRead 0 FirstWrite -1}
		ComputeWordCnt_loc_out {Type O LastRead -1 FirstWrite 0}
		decipher_0_2 {Type I LastRead -1 FirstWrite -1}
		Rcon {Type I LastRead -1 FirstWrite -1}
		decipher_0_3 {Type I LastRead -1 FirstWrite -1}
		decipher_0_1 {Type I LastRead -1 FirstWrite -1}}
	process_r {
		p_read {Type I LastRead 0 FirstWrite -1}
		p_read1 {Type I LastRead 0 FirstWrite -1}
		p_read2 {Type I LastRead 0 FirstWrite -1}
		p_read3 {Type I LastRead 0 FirstWrite -1}
		p_read4 {Type I LastRead 0 FirstWrite -1}
		p_read5 {Type I LastRead 0 FirstWrite -1}
		p_read6 {Type I LastRead 0 FirstWrite -1}
		p_read7 {Type I LastRead 0 FirstWrite -1}
		p_read8 {Type I LastRead 0 FirstWrite -1}
		p_read9 {Type I LastRead 0 FirstWrite -1}
		p_read10 {Type I LastRead 0 FirstWrite -1}
		p_read11 {Type I LastRead 0 FirstWrite -1}
		p_read12 {Type I LastRead 0 FirstWrite -1}
		p_read13 {Type I LastRead 0 FirstWrite -1}
		p_read14 {Type I LastRead 0 FirstWrite -1}
		ciphertext {Type I LastRead 0 FirstWrite -1}
		decipher_0_3 {Type I LastRead -1 FirstWrite -1}
		decipher_0_1 {Type I LastRead -1 FirstWrite -1}}
	updateKey {
		p_read1 {Type I LastRead 0 FirstWrite -1}
		p_read2 {Type I LastRead 0 FirstWrite -1}
		p_read3 {Type I LastRead 0 FirstWrite -1}
		p_read4 {Type I LastRead 0 FirstWrite -1}
		p_read5 {Type I LastRead 0 FirstWrite -1}
		p_read6 {Type I LastRead 0 FirstWrite -1}
		p_read7 {Type I LastRead 0 FirstWrite -1}
		p_read8 {Type I LastRead 0 FirstWrite -1}
		p_read9 {Type I LastRead 0 FirstWrite -1}
		p_read10 {Type I LastRead 0 FirstWrite -1}
		p_read11 {Type I LastRead 0 FirstWrite -1}
		p_read12 {Type I LastRead 0 FirstWrite -1}
		p_read13 {Type I LastRead 0 FirstWrite -1}
		p_read14 {Type I LastRead 0 FirstWrite -1}
		p_read15 {Type I LastRead 0 FirstWrite -1}
		cipherkey {Type I LastRead 0 FirstWrite -1}
		decipher_0_2 {Type I LastRead -1 FirstWrite -1}
		Rcon {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
	{"Pipeline" : "1", "EnableSignal" : "ap_enable_pp1"}
]}

set Spec2ImplPortList { 
	ciphertextStrm { ap_fifo {  { ciphertextStrm_dout fifo_data 0 128 }  { ciphertextStrm_empty_n fifo_status 0 1 }  { ciphertextStrm_read fifo_update 1 1 } } }
	endCiphertextStrm { ap_fifo {  { endCiphertextStrm_dout fifo_data 0 1 }  { endCiphertextStrm_empty_n fifo_status 0 1 }  { endCiphertextStrm_read fifo_update 1 1 } } }
	cipherkeyStrm { ap_fifo {  { cipherkeyStrm_dout fifo_data 0 256 }  { cipherkeyStrm_empty_n fifo_status 0 1 }  { cipherkeyStrm_read fifo_update 1 1 } } }
	IVStrm { ap_fifo {  { IVStrm_dout fifo_data 0 128 }  { IVStrm_empty_n fifo_status 0 1 }  { IVStrm_read fifo_update 1 1 } } }
	plaintextStrm { ap_fifo {  { plaintextStrm_din fifo_data 1 128 }  { plaintextStrm_full_n fifo_status 0 1 }  { plaintextStrm_write fifo_update 1 1 } } }
	endPlaintextStrm { ap_fifo {  { endPlaintextStrm_din fifo_data 1 1 }  { endPlaintextStrm_full_n fifo_status 0 1 }  { endPlaintextStrm_write fifo_update 1 1 } } }
	timeaes { ap_fifo {  { timeaes_din fifo_data 1 32 }  { timeaes_full_n fifo_status 0 1 }  { timeaes_write fifo_update 1 1 } } }
	ComputeWordCnt_loc { ap_fifo {  { ComputeWordCnt_loc_dout fifo_data 0 32 }  { ComputeWordCnt_loc_empty_n fifo_status 0 1 }  { ComputeWordCnt_loc_read fifo_update 1 1 } } }
	ComputeWordCnt_loc_out { ap_fifo {  { ComputeWordCnt_loc_out_din fifo_data 1 32 }  { ComputeWordCnt_loc_out_full_n fifo_status 0 1 }  { ComputeWordCnt_loc_out_write fifo_update 1 1 } } }
}
