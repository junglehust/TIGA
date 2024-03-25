set moduleName partition
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type dataflow
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {partition}
set C_modelType { void 0 }
set C_modelArgList {
	{ ComputeWordCnt_loc int 32 regular {fifo 0}  }
	{ ComputeWordCnt_loc_out int 32 regular {fifo 1}  }
	{ ComputeWordCnt_loc_out1 int 32 regular {fifo 1}  }
	{ s_data_net_out int 512 regular {fifo 0 volatile } {global 0}  }
	{ s_data_cal int 512 regular {fifo 1 volatile } {global 1}  }
	{ s_data_out int 512 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "ComputeWordCnt_loc", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ComputeWordCnt_loc_out", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ComputeWordCnt_loc_out1", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "s_data_net_out", "interface" : "fifo", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "s_data_cal", "interface" : "fifo", "bitwidth" : 512, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "s_data_out", "interface" : "fifo", "bitwidth" : 512, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 28
set portList { 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ start_full_n sc_in sc_logic 1 signal -1 } 
	{ start_out sc_out sc_logic 1 signal -1 } 
	{ start_write sc_out sc_logic 1 signal -1 } 
	{ ComputeWordCnt_loc_dout sc_in sc_lv 32 signal 0 } 
	{ ComputeWordCnt_loc_empty_n sc_in sc_logic 1 signal 0 } 
	{ ComputeWordCnt_loc_read sc_out sc_logic 1 signal 0 } 
	{ ComputeWordCnt_loc_out_din sc_out sc_lv 32 signal 1 } 
	{ ComputeWordCnt_loc_out_full_n sc_in sc_logic 1 signal 1 } 
	{ ComputeWordCnt_loc_out_write sc_out sc_logic 1 signal 1 } 
	{ ComputeWordCnt_loc_out1_din sc_out sc_lv 32 signal 2 } 
	{ ComputeWordCnt_loc_out1_full_n sc_in sc_logic 1 signal 2 } 
	{ ComputeWordCnt_loc_out1_write sc_out sc_logic 1 signal 2 } 
	{ s_data_net_out_dout sc_in sc_lv 512 signal 3 } 
	{ s_data_net_out_empty_n sc_in sc_logic 1 signal 3 } 
	{ s_data_net_out_read sc_out sc_logic 1 signal 3 } 
	{ s_data_cal_din sc_out sc_lv 512 signal 4 } 
	{ s_data_cal_full_n sc_in sc_logic 1 signal 4 } 
	{ s_data_cal_write sc_out sc_logic 1 signal 4 } 
	{ s_data_out_din sc_out sc_lv 512 signal 5 } 
	{ s_data_out_full_n sc_in sc_logic 1 signal 5 } 
	{ s_data_out_write sc_out sc_logic 1 signal 5 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
}
set NewPortList {[ 
	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "start_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_full_n", "role": "default" }} , 
 	{ "name": "start_out", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_out", "role": "default" }} , 
 	{ "name": "start_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_write", "role": "default" }} , 
 	{ "name": "ComputeWordCnt_loc_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ComputeWordCnt_loc", "role": "dout" }} , 
 	{ "name": "ComputeWordCnt_loc_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ComputeWordCnt_loc", "role": "empty_n" }} , 
 	{ "name": "ComputeWordCnt_loc_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ComputeWordCnt_loc", "role": "read" }} , 
 	{ "name": "ComputeWordCnt_loc_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ComputeWordCnt_loc_out", "role": "din" }} , 
 	{ "name": "ComputeWordCnt_loc_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ComputeWordCnt_loc_out", "role": "full_n" }} , 
 	{ "name": "ComputeWordCnt_loc_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ComputeWordCnt_loc_out", "role": "write" }} , 
 	{ "name": "ComputeWordCnt_loc_out1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ComputeWordCnt_loc_out1", "role": "din" }} , 
 	{ "name": "ComputeWordCnt_loc_out1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ComputeWordCnt_loc_out1", "role": "full_n" }} , 
 	{ "name": "ComputeWordCnt_loc_out1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ComputeWordCnt_loc_out1", "role": "write" }} , 
 	{ "name": "s_data_net_out_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "s_data_net_out", "role": "dout" }} , 
 	{ "name": "s_data_net_out_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s_data_net_out", "role": "empty_n" }} , 
 	{ "name": "s_data_net_out_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s_data_net_out", "role": "read" }} , 
 	{ "name": "s_data_cal_din", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "s_data_cal", "role": "din" }} , 
 	{ "name": "s_data_cal_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s_data_cal", "role": "full_n" }} , 
 	{ "name": "s_data_cal_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s_data_cal", "role": "write" }} , 
 	{ "name": "s_data_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "s_data_out", "role": "din" }} , 
 	{ "name": "s_data_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s_data_out", "role": "full_n" }} , 
 	{ "name": "s_data_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s_data_out", "role": "write" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "partition",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"InputProcess" : [
			{"ID" : "1", "Name" : "partition_Loop_VITIS_LOOP_71_1_proc2761_U0"}],
		"OutputProcess" : [
			{"ID" : "1", "Name" : "partition_Loop_VITIS_LOOP_71_1_proc2761_U0"}],
		"Port" : [
			{"Name" : "ComputeWordCnt_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "partition_Loop_VITIS_LOOP_71_1_proc2761_U0", "Port" : "scalar_ComputeWordCnt_loc"}]},
			{"Name" : "ComputeWordCnt_loc_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "partition_Loop_VITIS_LOOP_71_1_proc2761_U0", "Port" : "ComputeWordCnt_loc_out"}]},
			{"Name" : "ComputeWordCnt_loc_out1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "partition_Loop_VITIS_LOOP_71_1_proc2761_U0", "Port" : "ComputeWordCnt_loc_out1"}]},
			{"Name" : "s_data_net_out", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "partition_Loop_VITIS_LOOP_71_1_proc2761_U0", "Port" : "s_data_net_out"}]},
			{"Name" : "s_data_cal", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "partition_Loop_VITIS_LOOP_71_1_proc2761_U0", "Port" : "s_data_cal"}]},
			{"Name" : "s_data_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "partition_Loop_VITIS_LOOP_71_1_proc2761_U0", "Port" : "s_data_out"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.partition_Loop_VITIS_LOOP_71_1_proc2761_U0", "Parent" : "0",
		"CDFG" : "partition_Loop_VITIS_LOOP_71_1_proc2761",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
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
			{"Name" : "scalar_ComputeWordCnt_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "scalar_ComputeWordCnt_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ComputeWordCnt_loc_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "ComputeWordCnt_loc_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ComputeWordCnt_loc_out1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "ComputeWordCnt_loc_out1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s_data_net_out", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s_data_net_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s_data_cal", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s_data_cal_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s_data_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s_data_out_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	partition {
		ComputeWordCnt_loc {Type I LastRead 0 FirstWrite -1}
		ComputeWordCnt_loc_out {Type O LastRead -1 FirstWrite 0}
		ComputeWordCnt_loc_out1 {Type O LastRead -1 FirstWrite 0}
		s_data_net_out {Type I LastRead 2 FirstWrite -1}
		s_data_cal {Type O LastRead -1 FirstWrite 2}
		s_data_out {Type O LastRead -1 FirstWrite 2}}
	partition_Loop_VITIS_LOOP_71_1_proc2761 {
		scalar_ComputeWordCnt_loc {Type I LastRead 0 FirstWrite -1}
		ComputeWordCnt_loc_out {Type O LastRead -1 FirstWrite 0}
		ComputeWordCnt_loc_out1 {Type O LastRead -1 FirstWrite 0}
		s_data_net_out {Type I LastRead 2 FirstWrite -1}
		s_data_cal {Type O LastRead -1 FirstWrite 2}
		s_data_out {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	ComputeWordCnt_loc { ap_fifo {  { ComputeWordCnt_loc_dout fifo_data 0 32 }  { ComputeWordCnt_loc_empty_n fifo_status 0 1 }  { ComputeWordCnt_loc_read fifo_update 1 1 } } }
	ComputeWordCnt_loc_out { ap_fifo {  { ComputeWordCnt_loc_out_din fifo_data 1 32 }  { ComputeWordCnt_loc_out_full_n fifo_status 0 1 }  { ComputeWordCnt_loc_out_write fifo_update 1 1 } } }
	ComputeWordCnt_loc_out1 { ap_fifo {  { ComputeWordCnt_loc_out1_din fifo_data 1 32 }  { ComputeWordCnt_loc_out1_full_n fifo_status 0 1 }  { ComputeWordCnt_loc_out1_write fifo_update 1 1 } } }
	s_data_net_out { ap_fifo {  { s_data_net_out_dout fifo_data 0 512 }  { s_data_net_out_empty_n fifo_status 0 1 }  { s_data_net_out_read fifo_update 1 1 } } }
	s_data_cal { ap_fifo {  { s_data_cal_din fifo_data 1 512 }  { s_data_cal_full_n fifo_status 0 1 }  { s_data_cal_write fifo_update 1 1 } } }
	s_data_out { ap_fifo {  { s_data_out_din fifo_data 1 512 }  { s_data_out_full_n fifo_status 0 1 }  { s_data_out_write fifo_update 1 1 } } }
}
