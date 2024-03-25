// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Version: 2020.2
// Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module hls_recv_krnl_recvData_consumeData (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        nextRxPacketLength3_dout,
        nextRxPacketLength3_empty_n,
        nextRxPacketLength3_read,
        expRxBytePerSession_dout,
        expRxBytePerSession_empty_n,
        expRxBytePerSession_read,
        s_axis_tcp_rx_meta_TDATA,
        s_axis_tcp_rx_meta_TVALID,
        s_axis_tcp_rx_meta_TREADY,
        s_axis_tcp_rx_meta_TKEEP,
        s_axis_tcp_rx_meta_TSTRB,
        s_axis_tcp_rx_meta_TLAST,
        s_axis_tcp_rx_data_TDATA,
        s_axis_tcp_rx_data_TVALID,
        s_axis_tcp_rx_data_TREADY,
        s_axis_tcp_rx_data_TKEEP,
        s_axis_tcp_rx_data_TSTRB,
        s_axis_tcp_rx_data_TLAST,
        s_data_net_out_din,
        s_data_net_out_full_n,
        s_data_net_out_write
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_state3 = 4'd4;
parameter    ap_ST_fsm_state4 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [15:0] nextRxPacketLength3_dout;
input   nextRxPacketLength3_empty_n;
output   nextRxPacketLength3_read;
input  [63:0] expRxBytePerSession_dout;
input   expRxBytePerSession_empty_n;
output   expRxBytePerSession_read;
input  [15:0] s_axis_tcp_rx_meta_TDATA;
input   s_axis_tcp_rx_meta_TVALID;
output   s_axis_tcp_rx_meta_TREADY;
input  [1:0] s_axis_tcp_rx_meta_TKEEP;
input  [1:0] s_axis_tcp_rx_meta_TSTRB;
input  [0:0] s_axis_tcp_rx_meta_TLAST;
input  [511:0] s_axis_tcp_rx_data_TDATA;
input   s_axis_tcp_rx_data_TVALID;
output   s_axis_tcp_rx_data_TREADY;
input  [63:0] s_axis_tcp_rx_data_TKEEP;
input  [63:0] s_axis_tcp_rx_data_TSTRB;
input  [0:0] s_axis_tcp_rx_data_TLAST;
output  [511:0] s_data_net_out_din;
input   s_data_net_out_full_n;
output   s_data_net_out_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg nextRxPacketLength3_read;
reg expRxBytePerSession_read;
reg s_axis_tcp_rx_meta_TREADY;
reg s_axis_tcp_rx_data_TREADY;
reg s_data_net_out_write;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    nextRxPacketLength3_blk_n;
wire    ap_CS_fsm_state2;
wire   [0:0] and_ln1276_fu_146_p2;
reg    expRxBytePerSession_blk_n;
reg    s_axis_tcp_rx_meta_TDATA_blk_n;
reg    s_axis_tcp_rx_data_TDATA_blk_n;
wire    ap_CS_fsm_state3;
reg    s_data_net_out_blk_n;
reg   [63:0] expRxBytePerSession_read_reg_194;
reg   [0:0] and_ln1276_reg_199;
reg   [15:0] tmp_10_reg_203;
reg   [63:0] rxByteCnt_V_fu_72;
wire   [63:0] rxByteCnt_V_3_fu_167_p2;
wire    ap_CS_fsm_state4;
reg   [63:0] ap_sig_allocacmp_rxByteCnt_V_4;
reg    ap_block_state1;
wire   [0:0] tmp_nbreadreq_fu_82_p6;
wire   [0:0] tmp_i_i_nbreadreq_fu_96_p3;
reg    ap_block_state2;
reg    ap_block_state3;
wire   [63:0] zext_ln208_fu_164_p1;
wire   [0:0] lastWord_fu_157_p1;
wire   [0:0] icmp_ln878_fu_181_p2;
reg   [3:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 4'd1;
end

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
        end else if (((1'b1 == ap_CS_fsm_state4) & (icmp_ln878_fu_181_p2 == 1'd0))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_start == 1'b0) | (expRxBytePerSession_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        rxByteCnt_V_fu_72 <= 64'd0;
    end else if (((1'd1 == and_ln1276_reg_199) & (1'b1 == ap_CS_fsm_state4))) begin
        rxByteCnt_V_fu_72 <= rxByteCnt_V_3_fu_167_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        and_ln1276_reg_199 <= and_ln1276_fu_146_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        expRxBytePerSession_read_reg_194 <= expRxBytePerSession_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((1'd1 == and_ln1276_fu_146_p2) & (1'b1 == ap_CS_fsm_state2))) begin
        tmp_10_reg_203 <= nextRxPacketLength3_dout;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) & (icmp_ln878_fu_181_p2 == 1'd0))) begin
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
    if (((1'b1 == ap_CS_fsm_state4) & (icmp_ln878_fu_181_p2 == 1'd0))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((1'd1 == and_ln1276_reg_199) & (1'b1 == ap_CS_fsm_state4))) begin
        ap_sig_allocacmp_rxByteCnt_V_4 = rxByteCnt_V_3_fu_167_p2;
    end else begin
        ap_sig_allocacmp_rxByteCnt_V_4 = rxByteCnt_V_fu_72;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        expRxBytePerSession_blk_n = expRxBytePerSession_empty_n;
    end else begin
        expRxBytePerSession_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (expRxBytePerSession_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        expRxBytePerSession_read = 1'b1;
    end else begin
        expRxBytePerSession_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'd1 == and_ln1276_fu_146_p2) & (1'b1 == ap_CS_fsm_state2))) begin
        nextRxPacketLength3_blk_n = nextRxPacketLength3_empty_n;
    end else begin
        nextRxPacketLength3_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~(((1'd1 == and_ln1276_fu_146_p2) & (nextRxPacketLength3_empty_n == 1'b0)) | ((1'd1 == and_ln1276_fu_146_p2) & (s_axis_tcp_rx_meta_TVALID == 1'b0))) & (1'd1 == and_ln1276_fu_146_p2) & (1'b1 == ap_CS_fsm_state2))) begin
        nextRxPacketLength3_read = 1'b1;
    end else begin
        nextRxPacketLength3_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        s_axis_tcp_rx_data_TDATA_blk_n = s_axis_tcp_rx_data_TVALID;
    end else begin
        s_axis_tcp_rx_data_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((s_data_net_out_full_n == 1'b0) | (s_axis_tcp_rx_data_TVALID == 1'b0)) & (1'b1 == ap_CS_fsm_state3))) begin
        s_axis_tcp_rx_data_TREADY = 1'b1;
    end else begin
        s_axis_tcp_rx_data_TREADY = 1'b0;
    end
end

always @ (*) begin
    if (((1'd1 == and_ln1276_fu_146_p2) & (1'b1 == ap_CS_fsm_state2))) begin
        s_axis_tcp_rx_meta_TDATA_blk_n = s_axis_tcp_rx_meta_TVALID;
    end else begin
        s_axis_tcp_rx_meta_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~(((1'd1 == and_ln1276_fu_146_p2) & (nextRxPacketLength3_empty_n == 1'b0)) | ((1'd1 == and_ln1276_fu_146_p2) & (s_axis_tcp_rx_meta_TVALID == 1'b0))) & (1'd1 == and_ln1276_fu_146_p2) & (1'b1 == ap_CS_fsm_state2))) begin
        s_axis_tcp_rx_meta_TREADY = 1'b1;
    end else begin
        s_axis_tcp_rx_meta_TREADY = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        s_data_net_out_blk_n = s_data_net_out_full_n;
    end else begin
        s_data_net_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((s_data_net_out_full_n == 1'b0) | (s_axis_tcp_rx_data_TVALID == 1'b0)) & (1'b1 == ap_CS_fsm_state3))) begin
        s_data_net_out_write = 1'b1;
    end else begin
        s_data_net_out_write = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (expRxBytePerSession_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if ((~(((1'd1 == and_ln1276_fu_146_p2) & (nextRxPacketLength3_empty_n == 1'b0)) | ((1'd1 == and_ln1276_fu_146_p2) & (s_axis_tcp_rx_meta_TVALID == 1'b0))) & (1'd1 == and_ln1276_fu_146_p2) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else if ((~(((1'd1 == and_ln1276_fu_146_p2) & (nextRxPacketLength3_empty_n == 1'b0)) | ((1'd1 == and_ln1276_fu_146_p2) & (s_axis_tcp_rx_meta_TVALID == 1'b0))) & (1'b1 == ap_CS_fsm_state2) & (1'd0 == and_ln1276_fu_146_p2))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            if ((~((s_data_net_out_full_n == 1'b0) | (s_axis_tcp_rx_data_TVALID == 1'b0)) & (1'b1 == ap_CS_fsm_state3) & (lastWord_fu_157_p1 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else if ((~((s_data_net_out_full_n == 1'b0) | (s_axis_tcp_rx_data_TVALID == 1'b0)) & (1'b1 == ap_CS_fsm_state3) & (lastWord_fu_157_p1 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            if (((1'b1 == ap_CS_fsm_state4) & (icmp_ln878_fu_181_p2 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign and_ln1276_fu_146_p2 = (tmp_nbreadreq_fu_82_p6 & tmp_i_i_nbreadreq_fu_96_p3);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (expRxBytePerSession_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

always @ (*) begin
    ap_block_state2 = (((1'd1 == and_ln1276_fu_146_p2) & (nextRxPacketLength3_empty_n == 1'b0)) | ((1'd1 == and_ln1276_fu_146_p2) & (s_axis_tcp_rx_meta_TVALID == 1'b0)));
end

always @ (*) begin
    ap_block_state3 = ((s_data_net_out_full_n == 1'b0) | (s_axis_tcp_rx_data_TVALID == 1'b0));
end

assign icmp_ln878_fu_181_p2 = ((ap_sig_allocacmp_rxByteCnt_V_4 < expRxBytePerSession_read_reg_194) ? 1'b1 : 1'b0);

assign lastWord_fu_157_p1 = s_axis_tcp_rx_data_TLAST;

assign rxByteCnt_V_3_fu_167_p2 = (rxByteCnt_V_fu_72 + zext_ln208_fu_164_p1);

assign s_data_net_out_din = s_axis_tcp_rx_data_TDATA;

assign tmp_i_i_nbreadreq_fu_96_p3 = nextRxPacketLength3_empty_n;

assign tmp_nbreadreq_fu_82_p6 = s_axis_tcp_rx_meta_TVALID;

assign zext_ln208_fu_164_p1 = tmp_10_reg_203;

endmodule //hls_recv_krnl_recvData_consumeData
