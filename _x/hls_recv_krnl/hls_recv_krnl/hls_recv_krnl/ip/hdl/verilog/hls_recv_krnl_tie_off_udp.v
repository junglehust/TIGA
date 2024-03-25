// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Version: 2020.2
// Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module hls_recv_krnl_tie_off_udp (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        s_axis_udp_rx_TDATA,
        s_axis_udp_rx_TVALID,
        s_axis_udp_rx_TREADY,
        s_axis_udp_rx_TKEEP,
        s_axis_udp_rx_TSTRB,
        s_axis_udp_rx_TLAST,
        m_axis_udp_tx_TDATA,
        m_axis_udp_tx_TVALID,
        m_axis_udp_tx_TREADY,
        m_axis_udp_tx_TKEEP,
        m_axis_udp_tx_TSTRB,
        m_axis_udp_tx_TLAST,
        s_axis_udp_rx_meta_TDATA,
        s_axis_udp_rx_meta_TVALID,
        s_axis_udp_rx_meta_TREADY,
        s_axis_udp_rx_meta_TKEEP,
        s_axis_udp_rx_meta_TSTRB,
        s_axis_udp_rx_meta_TLAST,
        m_axis_udp_tx_meta_TDATA,
        m_axis_udp_tx_meta_TVALID,
        m_axis_udp_tx_meta_TREADY,
        m_axis_udp_tx_meta_TKEEP,
        m_axis_udp_tx_meta_TSTRB,
        m_axis_udp_tx_meta_TLAST
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_state2 = 3'd2;
parameter    ap_ST_fsm_state3 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [511:0] s_axis_udp_rx_TDATA;
input   s_axis_udp_rx_TVALID;
output   s_axis_udp_rx_TREADY;
input  [63:0] s_axis_udp_rx_TKEEP;
input  [63:0] s_axis_udp_rx_TSTRB;
input  [0:0] s_axis_udp_rx_TLAST;
output  [511:0] m_axis_udp_tx_TDATA;
output   m_axis_udp_tx_TVALID;
input   m_axis_udp_tx_TREADY;
output  [63:0] m_axis_udp_tx_TKEEP;
output  [63:0] m_axis_udp_tx_TSTRB;
output  [0:0] m_axis_udp_tx_TLAST;
input  [255:0] s_axis_udp_rx_meta_TDATA;
input   s_axis_udp_rx_meta_TVALID;
output   s_axis_udp_rx_meta_TREADY;
input  [31:0] s_axis_udp_rx_meta_TKEEP;
input  [31:0] s_axis_udp_rx_meta_TSTRB;
input  [0:0] s_axis_udp_rx_meta_TLAST;
output  [255:0] m_axis_udp_tx_meta_TDATA;
output   m_axis_udp_tx_meta_TVALID;
input   m_axis_udp_tx_meta_TREADY;
output  [31:0] m_axis_udp_tx_meta_TKEEP;
output  [31:0] m_axis_udp_tx_meta_TSTRB;
output  [0:0] m_axis_udp_tx_meta_TLAST;

reg ap_done;
reg ap_idle;
reg ap_ready;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    s_axis_udp_rx_TDATA_blk_n;
wire   [0:0] tmp_nbreadreq_fu_56_p6;
reg    m_axis_udp_tx_TDATA_blk_n;
wire    ap_CS_fsm_state2;
reg   [0:0] tmp_reg_180;
reg    s_axis_udp_rx_meta_TDATA_blk_n;
wire   [0:0] tmp_1_nbreadreq_fu_98_p6;
reg    m_axis_udp_tx_meta_TDATA_blk_n;
wire    ap_CS_fsm_state3;
reg   [0:0] tmp_1_reg_204;
reg    ap_block_state1;
reg    ap_block_state1_io;
reg    ap_block_state2;
reg    ap_block_state2_io;
wire    regslice_both_m_axis_udp_tx_V_data_V_U_apdone_blk;
wire    regslice_both_m_axis_udp_tx_meta_V_data_V_U_apdone_blk;
reg    ap_block_state3;
reg    ap_block_state3_io;
reg   [2:0] ap_NS_fsm;
wire    regslice_both_s_axis_udp_rx_V_data_V_U_apdone_blk;
wire   [511:0] s_axis_udp_rx_TDATA_int_regslice;
wire    s_axis_udp_rx_TVALID_int_regslice;
reg    s_axis_udp_rx_TREADY_int_regslice;
wire    regslice_both_s_axis_udp_rx_V_data_V_U_ack_in;
wire    regslice_both_s_axis_udp_rx_V_keep_V_U_apdone_blk;
wire   [63:0] s_axis_udp_rx_TKEEP_int_regslice;
wire    regslice_both_s_axis_udp_rx_V_keep_V_U_vld_out;
wire    regslice_both_s_axis_udp_rx_V_keep_V_U_ack_in;
wire    regslice_both_s_axis_udp_rx_V_strb_V_U_apdone_blk;
wire   [63:0] s_axis_udp_rx_TSTRB_int_regslice;
wire    regslice_both_s_axis_udp_rx_V_strb_V_U_vld_out;
wire    regslice_both_s_axis_udp_rx_V_strb_V_U_ack_in;
wire    regslice_both_s_axis_udp_rx_V_last_V_U_apdone_blk;
wire   [0:0] s_axis_udp_rx_TLAST_int_regslice;
wire    regslice_both_s_axis_udp_rx_V_last_V_U_vld_out;
wire    regslice_both_s_axis_udp_rx_V_last_V_U_ack_in;
reg    m_axis_udp_tx_TVALID_int_regslice;
wire    m_axis_udp_tx_TREADY_int_regslice;
wire    regslice_both_m_axis_udp_tx_V_data_V_U_vld_out;
wire    regslice_both_m_axis_udp_tx_V_keep_V_U_apdone_blk;
wire    regslice_both_m_axis_udp_tx_V_keep_V_U_ack_in_dummy;
wire    regslice_both_m_axis_udp_tx_V_keep_V_U_vld_out;
wire    regslice_both_m_axis_udp_tx_V_strb_V_U_apdone_blk;
wire    regslice_both_m_axis_udp_tx_V_strb_V_U_ack_in_dummy;
wire    regslice_both_m_axis_udp_tx_V_strb_V_U_vld_out;
wire    regslice_both_m_axis_udp_tx_V_last_V_U_apdone_blk;
wire    regslice_both_m_axis_udp_tx_V_last_V_U_ack_in_dummy;
wire    regslice_both_m_axis_udp_tx_V_last_V_U_vld_out;
wire    regslice_both_s_axis_udp_rx_meta_V_data_V_U_apdone_blk;
wire   [255:0] s_axis_udp_rx_meta_TDATA_int_regslice;
wire    s_axis_udp_rx_meta_TVALID_int_regslice;
reg    s_axis_udp_rx_meta_TREADY_int_regslice;
wire    regslice_both_s_axis_udp_rx_meta_V_data_V_U_ack_in;
wire    regslice_both_s_axis_udp_rx_meta_V_keep_V_U_apdone_blk;
wire   [31:0] s_axis_udp_rx_meta_TKEEP_int_regslice;
wire    regslice_both_s_axis_udp_rx_meta_V_keep_V_U_vld_out;
wire    regslice_both_s_axis_udp_rx_meta_V_keep_V_U_ack_in;
wire    regslice_both_s_axis_udp_rx_meta_V_strb_V_U_apdone_blk;
wire   [31:0] s_axis_udp_rx_meta_TSTRB_int_regslice;
wire    regslice_both_s_axis_udp_rx_meta_V_strb_V_U_vld_out;
wire    regslice_both_s_axis_udp_rx_meta_V_strb_V_U_ack_in;
wire    regslice_both_s_axis_udp_rx_meta_V_last_V_U_apdone_blk;
wire   [0:0] s_axis_udp_rx_meta_TLAST_int_regslice;
wire    regslice_both_s_axis_udp_rx_meta_V_last_V_U_vld_out;
wire    regslice_both_s_axis_udp_rx_meta_V_last_V_U_ack_in;
reg    m_axis_udp_tx_meta_TVALID_int_regslice;
wire    m_axis_udp_tx_meta_TREADY_int_regslice;
wire    regslice_both_m_axis_udp_tx_meta_V_data_V_U_vld_out;
wire    regslice_both_m_axis_udp_tx_meta_V_keep_V_U_apdone_blk;
wire    regslice_both_m_axis_udp_tx_meta_V_keep_V_U_ack_in_dummy;
wire    regslice_both_m_axis_udp_tx_meta_V_keep_V_U_vld_out;
wire    regslice_both_m_axis_udp_tx_meta_V_strb_V_U_apdone_blk;
wire    regslice_both_m_axis_udp_tx_meta_V_strb_V_U_ack_in_dummy;
wire    regslice_both_m_axis_udp_tx_meta_V_strb_V_U_vld_out;
wire    regslice_both_m_axis_udp_tx_meta_V_last_V_U_apdone_blk;
wire    regslice_both_m_axis_udp_tx_meta_V_last_V_U_ack_in_dummy;
wire    regslice_both_m_axis_udp_tx_meta_V_last_V_U_vld_out;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 3'd1;
end

hls_recv_krnl_regslice_both #(
    .DataWidth( 512 ))
regslice_both_s_axis_udp_rx_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(s_axis_udp_rx_TDATA),
    .vld_in(s_axis_udp_rx_TVALID),
    .ack_in(regslice_both_s_axis_udp_rx_V_data_V_U_ack_in),
    .data_out(s_axis_udp_rx_TDATA_int_regslice),
    .vld_out(s_axis_udp_rx_TVALID_int_regslice),
    .ack_out(s_axis_udp_rx_TREADY_int_regslice),
    .apdone_blk(regslice_both_s_axis_udp_rx_V_data_V_U_apdone_blk)
);

hls_recv_krnl_regslice_both #(
    .DataWidth( 64 ))
regslice_both_s_axis_udp_rx_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(s_axis_udp_rx_TKEEP),
    .vld_in(s_axis_udp_rx_TVALID),
    .ack_in(regslice_both_s_axis_udp_rx_V_keep_V_U_ack_in),
    .data_out(s_axis_udp_rx_TKEEP_int_regslice),
    .vld_out(regslice_both_s_axis_udp_rx_V_keep_V_U_vld_out),
    .ack_out(s_axis_udp_rx_TREADY_int_regslice),
    .apdone_blk(regslice_both_s_axis_udp_rx_V_keep_V_U_apdone_blk)
);

hls_recv_krnl_regslice_both #(
    .DataWidth( 64 ))
regslice_both_s_axis_udp_rx_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(s_axis_udp_rx_TSTRB),
    .vld_in(s_axis_udp_rx_TVALID),
    .ack_in(regslice_both_s_axis_udp_rx_V_strb_V_U_ack_in),
    .data_out(s_axis_udp_rx_TSTRB_int_regslice),
    .vld_out(regslice_both_s_axis_udp_rx_V_strb_V_U_vld_out),
    .ack_out(s_axis_udp_rx_TREADY_int_regslice),
    .apdone_blk(regslice_both_s_axis_udp_rx_V_strb_V_U_apdone_blk)
);

hls_recv_krnl_regslice_both #(
    .DataWidth( 1 ))
regslice_both_s_axis_udp_rx_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(s_axis_udp_rx_TLAST),
    .vld_in(s_axis_udp_rx_TVALID),
    .ack_in(regslice_both_s_axis_udp_rx_V_last_V_U_ack_in),
    .data_out(s_axis_udp_rx_TLAST_int_regslice),
    .vld_out(regslice_both_s_axis_udp_rx_V_last_V_U_vld_out),
    .ack_out(s_axis_udp_rx_TREADY_int_regslice),
    .apdone_blk(regslice_both_s_axis_udp_rx_V_last_V_U_apdone_blk)
);

hls_recv_krnl_regslice_both #(
    .DataWidth( 512 ))
regslice_both_m_axis_udp_tx_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(s_axis_udp_rx_TDATA_int_regslice),
    .vld_in(m_axis_udp_tx_TVALID_int_regslice),
    .ack_in(m_axis_udp_tx_TREADY_int_regslice),
    .data_out(m_axis_udp_tx_TDATA),
    .vld_out(regslice_both_m_axis_udp_tx_V_data_V_U_vld_out),
    .ack_out(m_axis_udp_tx_TREADY),
    .apdone_blk(regslice_both_m_axis_udp_tx_V_data_V_U_apdone_blk)
);

hls_recv_krnl_regslice_both #(
    .DataWidth( 64 ))
regslice_both_m_axis_udp_tx_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(s_axis_udp_rx_TKEEP_int_regslice),
    .vld_in(m_axis_udp_tx_TVALID_int_regslice),
    .ack_in(regslice_both_m_axis_udp_tx_V_keep_V_U_ack_in_dummy),
    .data_out(m_axis_udp_tx_TKEEP),
    .vld_out(regslice_both_m_axis_udp_tx_V_keep_V_U_vld_out),
    .ack_out(m_axis_udp_tx_TREADY),
    .apdone_blk(regslice_both_m_axis_udp_tx_V_keep_V_U_apdone_blk)
);

hls_recv_krnl_regslice_both #(
    .DataWidth( 64 ))
regslice_both_m_axis_udp_tx_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(s_axis_udp_rx_TSTRB_int_regslice),
    .vld_in(m_axis_udp_tx_TVALID_int_regslice),
    .ack_in(regslice_both_m_axis_udp_tx_V_strb_V_U_ack_in_dummy),
    .data_out(m_axis_udp_tx_TSTRB),
    .vld_out(regslice_both_m_axis_udp_tx_V_strb_V_U_vld_out),
    .ack_out(m_axis_udp_tx_TREADY),
    .apdone_blk(regslice_both_m_axis_udp_tx_V_strb_V_U_apdone_blk)
);

hls_recv_krnl_regslice_both #(
    .DataWidth( 1 ))
regslice_both_m_axis_udp_tx_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(s_axis_udp_rx_TLAST_int_regslice),
    .vld_in(m_axis_udp_tx_TVALID_int_regslice),
    .ack_in(regslice_both_m_axis_udp_tx_V_last_V_U_ack_in_dummy),
    .data_out(m_axis_udp_tx_TLAST),
    .vld_out(regslice_both_m_axis_udp_tx_V_last_V_U_vld_out),
    .ack_out(m_axis_udp_tx_TREADY),
    .apdone_blk(regslice_both_m_axis_udp_tx_V_last_V_U_apdone_blk)
);

hls_recv_krnl_regslice_both #(
    .DataWidth( 256 ))
regslice_both_s_axis_udp_rx_meta_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(s_axis_udp_rx_meta_TDATA),
    .vld_in(s_axis_udp_rx_meta_TVALID),
    .ack_in(regslice_both_s_axis_udp_rx_meta_V_data_V_U_ack_in),
    .data_out(s_axis_udp_rx_meta_TDATA_int_regslice),
    .vld_out(s_axis_udp_rx_meta_TVALID_int_regslice),
    .ack_out(s_axis_udp_rx_meta_TREADY_int_regslice),
    .apdone_blk(regslice_both_s_axis_udp_rx_meta_V_data_V_U_apdone_blk)
);

hls_recv_krnl_regslice_both #(
    .DataWidth( 32 ))
regslice_both_s_axis_udp_rx_meta_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(s_axis_udp_rx_meta_TKEEP),
    .vld_in(s_axis_udp_rx_meta_TVALID),
    .ack_in(regslice_both_s_axis_udp_rx_meta_V_keep_V_U_ack_in),
    .data_out(s_axis_udp_rx_meta_TKEEP_int_regslice),
    .vld_out(regslice_both_s_axis_udp_rx_meta_V_keep_V_U_vld_out),
    .ack_out(s_axis_udp_rx_meta_TREADY_int_regslice),
    .apdone_blk(regslice_both_s_axis_udp_rx_meta_V_keep_V_U_apdone_blk)
);

hls_recv_krnl_regslice_both #(
    .DataWidth( 32 ))
regslice_both_s_axis_udp_rx_meta_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(s_axis_udp_rx_meta_TSTRB),
    .vld_in(s_axis_udp_rx_meta_TVALID),
    .ack_in(regslice_both_s_axis_udp_rx_meta_V_strb_V_U_ack_in),
    .data_out(s_axis_udp_rx_meta_TSTRB_int_regslice),
    .vld_out(regslice_both_s_axis_udp_rx_meta_V_strb_V_U_vld_out),
    .ack_out(s_axis_udp_rx_meta_TREADY_int_regslice),
    .apdone_blk(regslice_both_s_axis_udp_rx_meta_V_strb_V_U_apdone_blk)
);

hls_recv_krnl_regslice_both #(
    .DataWidth( 1 ))
regslice_both_s_axis_udp_rx_meta_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(s_axis_udp_rx_meta_TLAST),
    .vld_in(s_axis_udp_rx_meta_TVALID),
    .ack_in(regslice_both_s_axis_udp_rx_meta_V_last_V_U_ack_in),
    .data_out(s_axis_udp_rx_meta_TLAST_int_regslice),
    .vld_out(regslice_both_s_axis_udp_rx_meta_V_last_V_U_vld_out),
    .ack_out(s_axis_udp_rx_meta_TREADY_int_regslice),
    .apdone_blk(regslice_both_s_axis_udp_rx_meta_V_last_V_U_apdone_blk)
);

hls_recv_krnl_regslice_both #(
    .DataWidth( 256 ))
regslice_both_m_axis_udp_tx_meta_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(s_axis_udp_rx_meta_TDATA_int_regslice),
    .vld_in(m_axis_udp_tx_meta_TVALID_int_regslice),
    .ack_in(m_axis_udp_tx_meta_TREADY_int_regslice),
    .data_out(m_axis_udp_tx_meta_TDATA),
    .vld_out(regslice_both_m_axis_udp_tx_meta_V_data_V_U_vld_out),
    .ack_out(m_axis_udp_tx_meta_TREADY),
    .apdone_blk(regslice_both_m_axis_udp_tx_meta_V_data_V_U_apdone_blk)
);

hls_recv_krnl_regslice_both #(
    .DataWidth( 32 ))
regslice_both_m_axis_udp_tx_meta_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(s_axis_udp_rx_meta_TKEEP_int_regslice),
    .vld_in(m_axis_udp_tx_meta_TVALID_int_regslice),
    .ack_in(regslice_both_m_axis_udp_tx_meta_V_keep_V_U_ack_in_dummy),
    .data_out(m_axis_udp_tx_meta_TKEEP),
    .vld_out(regslice_both_m_axis_udp_tx_meta_V_keep_V_U_vld_out),
    .ack_out(m_axis_udp_tx_meta_TREADY),
    .apdone_blk(regslice_both_m_axis_udp_tx_meta_V_keep_V_U_apdone_blk)
);

hls_recv_krnl_regslice_both #(
    .DataWidth( 32 ))
regslice_both_m_axis_udp_tx_meta_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(s_axis_udp_rx_meta_TSTRB_int_regslice),
    .vld_in(m_axis_udp_tx_meta_TVALID_int_regslice),
    .ack_in(regslice_both_m_axis_udp_tx_meta_V_strb_V_U_ack_in_dummy),
    .data_out(m_axis_udp_tx_meta_TSTRB),
    .vld_out(regslice_both_m_axis_udp_tx_meta_V_strb_V_U_vld_out),
    .ack_out(m_axis_udp_tx_meta_TREADY),
    .apdone_blk(regslice_both_m_axis_udp_tx_meta_V_strb_V_U_apdone_blk)
);

hls_recv_krnl_regslice_both #(
    .DataWidth( 1 ))
regslice_both_m_axis_udp_tx_meta_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(s_axis_udp_rx_meta_TLAST_int_regslice),
    .vld_in(m_axis_udp_tx_meta_TVALID_int_regslice),
    .ack_in(regslice_both_m_axis_udp_tx_meta_V_last_V_U_ack_in_dummy),
    .data_out(m_axis_udp_tx_meta_TLAST),
    .vld_out(regslice_both_m_axis_udp_tx_meta_V_last_V_U_vld_out),
    .ack_out(m_axis_udp_tx_meta_TREADY),
    .apdone_blk(regslice_both_m_axis_udp_tx_meta_V_last_V_U_apdone_blk)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if ((~((1'b1 == ap_block_state3_io) | (regslice_both_m_axis_udp_tx_meta_V_data_V_U_apdone_blk == 1'b1) | (regslice_both_m_axis_udp_tx_V_data_V_U_apdone_blk == 1'b1) | ((tmp_1_reg_204 == 1'd1) & (m_axis_udp_tx_meta_TREADY_int_regslice == 1'b0))) & (1'b1 == ap_CS_fsm_state3))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        tmp_1_reg_204 <= tmp_1_nbreadreq_fu_98_p6;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        tmp_reg_180 <= tmp_nbreadreq_fu_56_p6;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state3_io) | (regslice_both_m_axis_udp_tx_meta_V_data_V_U_apdone_blk == 1'b1) | (regslice_both_m_axis_udp_tx_V_data_V_U_apdone_blk == 1'b1) | ((tmp_1_reg_204 == 1'd1) & (m_axis_udp_tx_meta_TREADY_int_regslice == 1'b0))) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state3_io) | (regslice_both_m_axis_udp_tx_meta_V_data_V_U_apdone_blk == 1'b1) | (regslice_both_m_axis_udp_tx_V_data_V_U_apdone_blk == 1'b1) | ((tmp_1_reg_204 == 1'd1) & (m_axis_udp_tx_meta_TREADY_int_regslice == 1'b0))) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((((tmp_reg_180 == 1'd1) & (1'b1 == ap_CS_fsm_state2)) | (~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (tmp_nbreadreq_fu_56_p6 == 1'd1) & (1'b1 == ap_CS_fsm_state1)))) begin
        m_axis_udp_tx_TDATA_blk_n = m_axis_udp_tx_TREADY_int_regslice;
    end else begin
        m_axis_udp_tx_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (1'b1 == ap_block_state1_io) | (ap_done_reg == 1'b1) | ((tmp_nbreadreq_fu_56_p6 == 1'd1) & (m_axis_udp_tx_TREADY_int_regslice == 1'b0)) | ((tmp_nbreadreq_fu_56_p6 == 1'd1) & (s_axis_udp_rx_TVALID_int_regslice == 1'b0))) & (tmp_nbreadreq_fu_56_p6 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        m_axis_udp_tx_TVALID_int_regslice = 1'b1;
    end else begin
        m_axis_udp_tx_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if ((((tmp_1_reg_204 == 1'd1) & (1'b1 == ap_CS_fsm_state3)) | ((tmp_1_nbreadreq_fu_98_p6 == 1'd1) & (1'b1 == ap_CS_fsm_state2)))) begin
        m_axis_udp_tx_meta_TDATA_blk_n = m_axis_udp_tx_meta_TREADY_int_regslice;
    end else begin
        m_axis_udp_tx_meta_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state2_io) | ((tmp_1_nbreadreq_fu_98_p6 == 1'd1) & (m_axis_udp_tx_meta_TREADY_int_regslice == 1'b0)) | ((tmp_1_nbreadreq_fu_98_p6 == 1'd1) & (s_axis_udp_rx_meta_TVALID_int_regslice == 1'b0)) | ((tmp_reg_180 == 1'd1) & (m_axis_udp_tx_TREADY_int_regslice == 1'b0))) & (tmp_1_nbreadreq_fu_98_p6 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        m_axis_udp_tx_meta_TVALID_int_regslice = 1'b1;
    end else begin
        m_axis_udp_tx_meta_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (tmp_nbreadreq_fu_56_p6 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        s_axis_udp_rx_TDATA_blk_n = s_axis_udp_rx_TVALID_int_regslice;
    end else begin
        s_axis_udp_rx_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (1'b1 == ap_block_state1_io) | (ap_done_reg == 1'b1) | ((tmp_nbreadreq_fu_56_p6 == 1'd1) & (m_axis_udp_tx_TREADY_int_regslice == 1'b0)) | ((tmp_nbreadreq_fu_56_p6 == 1'd1) & (s_axis_udp_rx_TVALID_int_regslice == 1'b0))) & (tmp_nbreadreq_fu_56_p6 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        s_axis_udp_rx_TREADY_int_regslice = 1'b1;
    end else begin
        s_axis_udp_rx_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_1_nbreadreq_fu_98_p6 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        s_axis_udp_rx_meta_TDATA_blk_n = s_axis_udp_rx_meta_TVALID_int_regslice;
    end else begin
        s_axis_udp_rx_meta_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state2_io) | ((tmp_1_nbreadreq_fu_98_p6 == 1'd1) & (m_axis_udp_tx_meta_TREADY_int_regslice == 1'b0)) | ((tmp_1_nbreadreq_fu_98_p6 == 1'd1) & (s_axis_udp_rx_meta_TVALID_int_regslice == 1'b0)) | ((tmp_reg_180 == 1'd1) & (m_axis_udp_tx_TREADY_int_regslice == 1'b0))) & (tmp_1_nbreadreq_fu_98_p6 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        s_axis_udp_rx_meta_TREADY_int_regslice = 1'b1;
    end else begin
        s_axis_udp_rx_meta_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (1'b1 == ap_block_state1_io) | (ap_done_reg == 1'b1) | ((tmp_nbreadreq_fu_56_p6 == 1'd1) & (m_axis_udp_tx_TREADY_int_regslice == 1'b0)) | ((tmp_nbreadreq_fu_56_p6 == 1'd1) & (s_axis_udp_rx_TVALID_int_regslice == 1'b0))) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if ((~((1'b1 == ap_block_state2_io) | ((tmp_1_nbreadreq_fu_98_p6 == 1'd1) & (m_axis_udp_tx_meta_TREADY_int_regslice == 1'b0)) | ((tmp_1_nbreadreq_fu_98_p6 == 1'd1) & (s_axis_udp_rx_meta_TVALID_int_regslice == 1'b0)) | ((tmp_reg_180 == 1'd1) & (m_axis_udp_tx_TREADY_int_regslice == 1'b0))) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            if ((~((1'b1 == ap_block_state3_io) | (regslice_both_m_axis_udp_tx_meta_V_data_V_U_apdone_blk == 1'b1) | (regslice_both_m_axis_udp_tx_V_data_V_U_apdone_blk == 1'b1) | ((tmp_1_reg_204 == 1'd1) & (m_axis_udp_tx_meta_TREADY_int_regslice == 1'b0))) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1) | ((tmp_nbreadreq_fu_56_p6 == 1'd1) & (m_axis_udp_tx_TREADY_int_regslice == 1'b0)) | ((tmp_nbreadreq_fu_56_p6 == 1'd1) & (s_axis_udp_rx_TVALID_int_regslice == 1'b0)));
end

always @ (*) begin
    ap_block_state1_io = ((tmp_nbreadreq_fu_56_p6 == 1'd1) & (m_axis_udp_tx_TREADY_int_regslice == 1'b0));
end

always @ (*) begin
    ap_block_state2 = (((tmp_1_nbreadreq_fu_98_p6 == 1'd1) & (m_axis_udp_tx_meta_TREADY_int_regslice == 1'b0)) | ((tmp_1_nbreadreq_fu_98_p6 == 1'd1) & (s_axis_udp_rx_meta_TVALID_int_regslice == 1'b0)) | ((tmp_reg_180 == 1'd1) & (m_axis_udp_tx_TREADY_int_regslice == 1'b0)));
end

always @ (*) begin
    ap_block_state2_io = (((tmp_1_nbreadreq_fu_98_p6 == 1'd1) & (m_axis_udp_tx_meta_TREADY_int_regslice == 1'b0)) | ((tmp_reg_180 == 1'd1) & (m_axis_udp_tx_TREADY_int_regslice == 1'b0)));
end

always @ (*) begin
    ap_block_state3 = ((regslice_both_m_axis_udp_tx_meta_V_data_V_U_apdone_blk == 1'b1) | (regslice_both_m_axis_udp_tx_V_data_V_U_apdone_blk == 1'b1) | ((tmp_1_reg_204 == 1'd1) & (m_axis_udp_tx_meta_TREADY_int_regslice == 1'b0)));
end

always @ (*) begin
    ap_block_state3_io = ((tmp_1_reg_204 == 1'd1) & (m_axis_udp_tx_meta_TREADY_int_regslice == 1'b0));
end

assign m_axis_udp_tx_TVALID = regslice_both_m_axis_udp_tx_V_data_V_U_vld_out;

assign m_axis_udp_tx_meta_TVALID = regslice_both_m_axis_udp_tx_meta_V_data_V_U_vld_out;

assign s_axis_udp_rx_TREADY = regslice_both_s_axis_udp_rx_V_data_V_U_ack_in;

assign s_axis_udp_rx_meta_TREADY = regslice_both_s_axis_udp_rx_meta_V_data_V_U_ack_in;

assign tmp_1_nbreadreq_fu_98_p6 = s_axis_udp_rx_meta_TVALID_int_regslice;

assign tmp_nbreadreq_fu_56_p6 = s_axis_udp_rx_TVALID_int_regslice;

endmodule //hls_recv_krnl_tie_off_udp
