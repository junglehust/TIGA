-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Version: 2020.2
-- Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity hls_recv_krnl_tie_off_udp is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    s_axis_udp_rx_TDATA : IN STD_LOGIC_VECTOR (511 downto 0);
    s_axis_udp_rx_TVALID : IN STD_LOGIC;
    s_axis_udp_rx_TREADY : OUT STD_LOGIC;
    s_axis_udp_rx_TKEEP : IN STD_LOGIC_VECTOR (63 downto 0);
    s_axis_udp_rx_TSTRB : IN STD_LOGIC_VECTOR (63 downto 0);
    s_axis_udp_rx_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axis_udp_tx_TDATA : OUT STD_LOGIC_VECTOR (511 downto 0);
    m_axis_udp_tx_TVALID : OUT STD_LOGIC;
    m_axis_udp_tx_TREADY : IN STD_LOGIC;
    m_axis_udp_tx_TKEEP : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axis_udp_tx_TSTRB : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axis_udp_tx_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0);
    s_axis_udp_rx_meta_TDATA : IN STD_LOGIC_VECTOR (255 downto 0);
    s_axis_udp_rx_meta_TVALID : IN STD_LOGIC;
    s_axis_udp_rx_meta_TREADY : OUT STD_LOGIC;
    s_axis_udp_rx_meta_TKEEP : IN STD_LOGIC_VECTOR (31 downto 0);
    s_axis_udp_rx_meta_TSTRB : IN STD_LOGIC_VECTOR (31 downto 0);
    s_axis_udp_rx_meta_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axis_udp_tx_meta_TDATA : OUT STD_LOGIC_VECTOR (255 downto 0);
    m_axis_udp_tx_meta_TVALID : OUT STD_LOGIC;
    m_axis_udp_tx_meta_TREADY : IN STD_LOGIC;
    m_axis_udp_tx_meta_TKEEP : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axis_udp_tx_meta_TSTRB : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axis_udp_tx_meta_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0) );
end;


architecture behav of hls_recv_krnl_tie_off_udp is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";

attribute shreg_extract : string;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal s_axis_udp_rx_TDATA_blk_n : STD_LOGIC;
    signal tmp_nbreadreq_fu_56_p6 : STD_LOGIC_VECTOR (0 downto 0);
    signal m_axis_udp_tx_TDATA_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal tmp_reg_180 : STD_LOGIC_VECTOR (0 downto 0);
    signal s_axis_udp_rx_meta_TDATA_blk_n : STD_LOGIC;
    signal tmp_1_nbreadreq_fu_98_p6 : STD_LOGIC_VECTOR (0 downto 0);
    signal m_axis_udp_tx_meta_TDATA_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal tmp_1_reg_204 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state1 : BOOLEAN;
    signal ap_block_state1_io : BOOLEAN;
    signal ap_block_state2 : BOOLEAN;
    signal ap_block_state2_io : BOOLEAN;
    signal regslice_both_m_axis_udp_tx_V_data_V_U_apdone_blk : STD_LOGIC;
    signal regslice_both_m_axis_udp_tx_meta_V_data_V_U_apdone_blk : STD_LOGIC;
    signal ap_block_state3 : BOOLEAN;
    signal ap_block_state3_io : BOOLEAN;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);
    signal regslice_both_s_axis_udp_rx_V_data_V_U_apdone_blk : STD_LOGIC;
    signal s_axis_udp_rx_TDATA_int_regslice : STD_LOGIC_VECTOR (511 downto 0);
    signal s_axis_udp_rx_TVALID_int_regslice : STD_LOGIC;
    signal s_axis_udp_rx_TREADY_int_regslice : STD_LOGIC;
    signal regslice_both_s_axis_udp_rx_V_data_V_U_ack_in : STD_LOGIC;
    signal regslice_both_s_axis_udp_rx_V_keep_V_U_apdone_blk : STD_LOGIC;
    signal s_axis_udp_rx_TKEEP_int_regslice : STD_LOGIC_VECTOR (63 downto 0);
    signal regslice_both_s_axis_udp_rx_V_keep_V_U_vld_out : STD_LOGIC;
    signal regslice_both_s_axis_udp_rx_V_keep_V_U_ack_in : STD_LOGIC;
    signal regslice_both_s_axis_udp_rx_V_strb_V_U_apdone_blk : STD_LOGIC;
    signal s_axis_udp_rx_TSTRB_int_regslice : STD_LOGIC_VECTOR (63 downto 0);
    signal regslice_both_s_axis_udp_rx_V_strb_V_U_vld_out : STD_LOGIC;
    signal regslice_both_s_axis_udp_rx_V_strb_V_U_ack_in : STD_LOGIC;
    signal regslice_both_s_axis_udp_rx_V_last_V_U_apdone_blk : STD_LOGIC;
    signal s_axis_udp_rx_TLAST_int_regslice : STD_LOGIC_VECTOR (0 downto 0);
    signal regslice_both_s_axis_udp_rx_V_last_V_U_vld_out : STD_LOGIC;
    signal regslice_both_s_axis_udp_rx_V_last_V_U_ack_in : STD_LOGIC;
    signal m_axis_udp_tx_TVALID_int_regslice : STD_LOGIC;
    signal m_axis_udp_tx_TREADY_int_regslice : STD_LOGIC;
    signal regslice_both_m_axis_udp_tx_V_data_V_U_vld_out : STD_LOGIC;
    signal regslice_both_m_axis_udp_tx_V_keep_V_U_apdone_blk : STD_LOGIC;
    signal regslice_both_m_axis_udp_tx_V_keep_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_m_axis_udp_tx_V_keep_V_U_vld_out : STD_LOGIC;
    signal regslice_both_m_axis_udp_tx_V_strb_V_U_apdone_blk : STD_LOGIC;
    signal regslice_both_m_axis_udp_tx_V_strb_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_m_axis_udp_tx_V_strb_V_U_vld_out : STD_LOGIC;
    signal regslice_both_m_axis_udp_tx_V_last_V_U_apdone_blk : STD_LOGIC;
    signal regslice_both_m_axis_udp_tx_V_last_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_m_axis_udp_tx_V_last_V_U_vld_out : STD_LOGIC;
    signal regslice_both_s_axis_udp_rx_meta_V_data_V_U_apdone_blk : STD_LOGIC;
    signal s_axis_udp_rx_meta_TDATA_int_regslice : STD_LOGIC_VECTOR (255 downto 0);
    signal s_axis_udp_rx_meta_TVALID_int_regslice : STD_LOGIC;
    signal s_axis_udp_rx_meta_TREADY_int_regslice : STD_LOGIC;
    signal regslice_both_s_axis_udp_rx_meta_V_data_V_U_ack_in : STD_LOGIC;
    signal regslice_both_s_axis_udp_rx_meta_V_keep_V_U_apdone_blk : STD_LOGIC;
    signal s_axis_udp_rx_meta_TKEEP_int_regslice : STD_LOGIC_VECTOR (31 downto 0);
    signal regslice_both_s_axis_udp_rx_meta_V_keep_V_U_vld_out : STD_LOGIC;
    signal regslice_both_s_axis_udp_rx_meta_V_keep_V_U_ack_in : STD_LOGIC;
    signal regslice_both_s_axis_udp_rx_meta_V_strb_V_U_apdone_blk : STD_LOGIC;
    signal s_axis_udp_rx_meta_TSTRB_int_regslice : STD_LOGIC_VECTOR (31 downto 0);
    signal regslice_both_s_axis_udp_rx_meta_V_strb_V_U_vld_out : STD_LOGIC;
    signal regslice_both_s_axis_udp_rx_meta_V_strb_V_U_ack_in : STD_LOGIC;
    signal regslice_both_s_axis_udp_rx_meta_V_last_V_U_apdone_blk : STD_LOGIC;
    signal s_axis_udp_rx_meta_TLAST_int_regslice : STD_LOGIC_VECTOR (0 downto 0);
    signal regslice_both_s_axis_udp_rx_meta_V_last_V_U_vld_out : STD_LOGIC;
    signal regslice_both_s_axis_udp_rx_meta_V_last_V_U_ack_in : STD_LOGIC;
    signal m_axis_udp_tx_meta_TVALID_int_regslice : STD_LOGIC;
    signal m_axis_udp_tx_meta_TREADY_int_regslice : STD_LOGIC;
    signal regslice_both_m_axis_udp_tx_meta_V_data_V_U_vld_out : STD_LOGIC;
    signal regslice_both_m_axis_udp_tx_meta_V_keep_V_U_apdone_blk : STD_LOGIC;
    signal regslice_both_m_axis_udp_tx_meta_V_keep_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_m_axis_udp_tx_meta_V_keep_V_U_vld_out : STD_LOGIC;
    signal regslice_both_m_axis_udp_tx_meta_V_strb_V_U_apdone_blk : STD_LOGIC;
    signal regslice_both_m_axis_udp_tx_meta_V_strb_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_m_axis_udp_tx_meta_V_strb_V_U_vld_out : STD_LOGIC;
    signal regslice_both_m_axis_udp_tx_meta_V_last_V_U_apdone_blk : STD_LOGIC;
    signal regslice_both_m_axis_udp_tx_meta_V_last_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_m_axis_udp_tx_meta_V_last_V_U_vld_out : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component hls_recv_krnl_regslice_both IS
    generic (
        DataWidth : INTEGER );
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        data_in : IN STD_LOGIC_VECTOR (DataWidth-1 downto 0);
        vld_in : IN STD_LOGIC;
        ack_in : OUT STD_LOGIC;
        data_out : OUT STD_LOGIC_VECTOR (DataWidth-1 downto 0);
        vld_out : OUT STD_LOGIC;
        ack_out : IN STD_LOGIC;
        apdone_blk : OUT STD_LOGIC );
    end component;



begin
    regslice_both_s_axis_udp_rx_V_data_V_U : component hls_recv_krnl_regslice_both
    generic map (
        DataWidth => 512)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => s_axis_udp_rx_TDATA,
        vld_in => s_axis_udp_rx_TVALID,
        ack_in => regslice_both_s_axis_udp_rx_V_data_V_U_ack_in,
        data_out => s_axis_udp_rx_TDATA_int_regslice,
        vld_out => s_axis_udp_rx_TVALID_int_regslice,
        ack_out => s_axis_udp_rx_TREADY_int_regslice,
        apdone_blk => regslice_both_s_axis_udp_rx_V_data_V_U_apdone_blk);

    regslice_both_s_axis_udp_rx_V_keep_V_U : component hls_recv_krnl_regslice_both
    generic map (
        DataWidth => 64)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => s_axis_udp_rx_TKEEP,
        vld_in => s_axis_udp_rx_TVALID,
        ack_in => regslice_both_s_axis_udp_rx_V_keep_V_U_ack_in,
        data_out => s_axis_udp_rx_TKEEP_int_regslice,
        vld_out => regslice_both_s_axis_udp_rx_V_keep_V_U_vld_out,
        ack_out => s_axis_udp_rx_TREADY_int_regslice,
        apdone_blk => regslice_both_s_axis_udp_rx_V_keep_V_U_apdone_blk);

    regslice_both_s_axis_udp_rx_V_strb_V_U : component hls_recv_krnl_regslice_both
    generic map (
        DataWidth => 64)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => s_axis_udp_rx_TSTRB,
        vld_in => s_axis_udp_rx_TVALID,
        ack_in => regslice_both_s_axis_udp_rx_V_strb_V_U_ack_in,
        data_out => s_axis_udp_rx_TSTRB_int_regslice,
        vld_out => regslice_both_s_axis_udp_rx_V_strb_V_U_vld_out,
        ack_out => s_axis_udp_rx_TREADY_int_regslice,
        apdone_blk => regslice_both_s_axis_udp_rx_V_strb_V_U_apdone_blk);

    regslice_both_s_axis_udp_rx_V_last_V_U : component hls_recv_krnl_regslice_both
    generic map (
        DataWidth => 1)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => s_axis_udp_rx_TLAST,
        vld_in => s_axis_udp_rx_TVALID,
        ack_in => regslice_both_s_axis_udp_rx_V_last_V_U_ack_in,
        data_out => s_axis_udp_rx_TLAST_int_regslice,
        vld_out => regslice_both_s_axis_udp_rx_V_last_V_U_vld_out,
        ack_out => s_axis_udp_rx_TREADY_int_regslice,
        apdone_blk => regslice_both_s_axis_udp_rx_V_last_V_U_apdone_blk);

    regslice_both_m_axis_udp_tx_V_data_V_U : component hls_recv_krnl_regslice_both
    generic map (
        DataWidth => 512)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => s_axis_udp_rx_TDATA_int_regslice,
        vld_in => m_axis_udp_tx_TVALID_int_regslice,
        ack_in => m_axis_udp_tx_TREADY_int_regslice,
        data_out => m_axis_udp_tx_TDATA,
        vld_out => regslice_both_m_axis_udp_tx_V_data_V_U_vld_out,
        ack_out => m_axis_udp_tx_TREADY,
        apdone_blk => regslice_both_m_axis_udp_tx_V_data_V_U_apdone_blk);

    regslice_both_m_axis_udp_tx_V_keep_V_U : component hls_recv_krnl_regslice_both
    generic map (
        DataWidth => 64)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => s_axis_udp_rx_TKEEP_int_regslice,
        vld_in => m_axis_udp_tx_TVALID_int_regslice,
        ack_in => regslice_both_m_axis_udp_tx_V_keep_V_U_ack_in_dummy,
        data_out => m_axis_udp_tx_TKEEP,
        vld_out => regslice_both_m_axis_udp_tx_V_keep_V_U_vld_out,
        ack_out => m_axis_udp_tx_TREADY,
        apdone_blk => regslice_both_m_axis_udp_tx_V_keep_V_U_apdone_blk);

    regslice_both_m_axis_udp_tx_V_strb_V_U : component hls_recv_krnl_regslice_both
    generic map (
        DataWidth => 64)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => s_axis_udp_rx_TSTRB_int_regslice,
        vld_in => m_axis_udp_tx_TVALID_int_regslice,
        ack_in => regslice_both_m_axis_udp_tx_V_strb_V_U_ack_in_dummy,
        data_out => m_axis_udp_tx_TSTRB,
        vld_out => regslice_both_m_axis_udp_tx_V_strb_V_U_vld_out,
        ack_out => m_axis_udp_tx_TREADY,
        apdone_blk => regslice_both_m_axis_udp_tx_V_strb_V_U_apdone_blk);

    regslice_both_m_axis_udp_tx_V_last_V_U : component hls_recv_krnl_regslice_both
    generic map (
        DataWidth => 1)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => s_axis_udp_rx_TLAST_int_regslice,
        vld_in => m_axis_udp_tx_TVALID_int_regslice,
        ack_in => regslice_both_m_axis_udp_tx_V_last_V_U_ack_in_dummy,
        data_out => m_axis_udp_tx_TLAST,
        vld_out => regslice_both_m_axis_udp_tx_V_last_V_U_vld_out,
        ack_out => m_axis_udp_tx_TREADY,
        apdone_blk => regslice_both_m_axis_udp_tx_V_last_V_U_apdone_blk);

    regslice_both_s_axis_udp_rx_meta_V_data_V_U : component hls_recv_krnl_regslice_both
    generic map (
        DataWidth => 256)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => s_axis_udp_rx_meta_TDATA,
        vld_in => s_axis_udp_rx_meta_TVALID,
        ack_in => regslice_both_s_axis_udp_rx_meta_V_data_V_U_ack_in,
        data_out => s_axis_udp_rx_meta_TDATA_int_regslice,
        vld_out => s_axis_udp_rx_meta_TVALID_int_regslice,
        ack_out => s_axis_udp_rx_meta_TREADY_int_regslice,
        apdone_blk => regslice_both_s_axis_udp_rx_meta_V_data_V_U_apdone_blk);

    regslice_both_s_axis_udp_rx_meta_V_keep_V_U : component hls_recv_krnl_regslice_both
    generic map (
        DataWidth => 32)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => s_axis_udp_rx_meta_TKEEP,
        vld_in => s_axis_udp_rx_meta_TVALID,
        ack_in => regslice_both_s_axis_udp_rx_meta_V_keep_V_U_ack_in,
        data_out => s_axis_udp_rx_meta_TKEEP_int_regslice,
        vld_out => regslice_both_s_axis_udp_rx_meta_V_keep_V_U_vld_out,
        ack_out => s_axis_udp_rx_meta_TREADY_int_regslice,
        apdone_blk => regslice_both_s_axis_udp_rx_meta_V_keep_V_U_apdone_blk);

    regslice_both_s_axis_udp_rx_meta_V_strb_V_U : component hls_recv_krnl_regslice_both
    generic map (
        DataWidth => 32)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => s_axis_udp_rx_meta_TSTRB,
        vld_in => s_axis_udp_rx_meta_TVALID,
        ack_in => regslice_both_s_axis_udp_rx_meta_V_strb_V_U_ack_in,
        data_out => s_axis_udp_rx_meta_TSTRB_int_regslice,
        vld_out => regslice_both_s_axis_udp_rx_meta_V_strb_V_U_vld_out,
        ack_out => s_axis_udp_rx_meta_TREADY_int_regslice,
        apdone_blk => regslice_both_s_axis_udp_rx_meta_V_strb_V_U_apdone_blk);

    regslice_both_s_axis_udp_rx_meta_V_last_V_U : component hls_recv_krnl_regslice_both
    generic map (
        DataWidth => 1)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => s_axis_udp_rx_meta_TLAST,
        vld_in => s_axis_udp_rx_meta_TVALID,
        ack_in => regslice_both_s_axis_udp_rx_meta_V_last_V_U_ack_in,
        data_out => s_axis_udp_rx_meta_TLAST_int_regslice,
        vld_out => regslice_both_s_axis_udp_rx_meta_V_last_V_U_vld_out,
        ack_out => s_axis_udp_rx_meta_TREADY_int_regslice,
        apdone_blk => regslice_both_s_axis_udp_rx_meta_V_last_V_U_apdone_blk);

    regslice_both_m_axis_udp_tx_meta_V_data_V_U : component hls_recv_krnl_regslice_both
    generic map (
        DataWidth => 256)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => s_axis_udp_rx_meta_TDATA_int_regslice,
        vld_in => m_axis_udp_tx_meta_TVALID_int_regslice,
        ack_in => m_axis_udp_tx_meta_TREADY_int_regslice,
        data_out => m_axis_udp_tx_meta_TDATA,
        vld_out => regslice_both_m_axis_udp_tx_meta_V_data_V_U_vld_out,
        ack_out => m_axis_udp_tx_meta_TREADY,
        apdone_blk => regslice_both_m_axis_udp_tx_meta_V_data_V_U_apdone_blk);

    regslice_both_m_axis_udp_tx_meta_V_keep_V_U : component hls_recv_krnl_regslice_both
    generic map (
        DataWidth => 32)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => s_axis_udp_rx_meta_TKEEP_int_regslice,
        vld_in => m_axis_udp_tx_meta_TVALID_int_regslice,
        ack_in => regslice_both_m_axis_udp_tx_meta_V_keep_V_U_ack_in_dummy,
        data_out => m_axis_udp_tx_meta_TKEEP,
        vld_out => regslice_both_m_axis_udp_tx_meta_V_keep_V_U_vld_out,
        ack_out => m_axis_udp_tx_meta_TREADY,
        apdone_blk => regslice_both_m_axis_udp_tx_meta_V_keep_V_U_apdone_blk);

    regslice_both_m_axis_udp_tx_meta_V_strb_V_U : component hls_recv_krnl_regslice_both
    generic map (
        DataWidth => 32)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => s_axis_udp_rx_meta_TSTRB_int_regslice,
        vld_in => m_axis_udp_tx_meta_TVALID_int_regslice,
        ack_in => regslice_both_m_axis_udp_tx_meta_V_strb_V_U_ack_in_dummy,
        data_out => m_axis_udp_tx_meta_TSTRB,
        vld_out => regslice_both_m_axis_udp_tx_meta_V_strb_V_U_vld_out,
        ack_out => m_axis_udp_tx_meta_TREADY,
        apdone_blk => regslice_both_m_axis_udp_tx_meta_V_strb_V_U_apdone_blk);

    regslice_both_m_axis_udp_tx_meta_V_last_V_U : component hls_recv_krnl_regslice_both
    generic map (
        DataWidth => 1)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => s_axis_udp_rx_meta_TLAST_int_regslice,
        vld_in => m_axis_udp_tx_meta_TVALID_int_regslice,
        ack_in => regslice_both_m_axis_udp_tx_meta_V_last_V_U_ack_in_dummy,
        data_out => m_axis_udp_tx_meta_TLAST,
        vld_out => regslice_both_m_axis_udp_tx_meta_V_last_V_U_vld_out,
        ack_out => m_axis_udp_tx_meta_TREADY,
        apdone_blk => regslice_both_m_axis_udp_tx_meta_V_last_V_U_apdone_blk);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif ((not(((ap_const_boolean_1 = ap_block_state3_io) or (regslice_both_m_axis_udp_tx_meta_V_data_V_U_apdone_blk = ap_const_logic_1) or (regslice_both_m_axis_udp_tx_V_data_V_U_apdone_blk = ap_const_logic_1) or ((tmp_1_reg_204 = ap_const_lv1_1) and (m_axis_udp_tx_meta_TREADY_int_regslice = ap_const_logic_0)))) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                tmp_1_reg_204 <= tmp_1_nbreadreq_fu_98_p6;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                tmp_reg_180 <= tmp_nbreadreq_fu_56_p6;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, tmp_nbreadreq_fu_56_p6, ap_CS_fsm_state2, tmp_reg_180, tmp_1_nbreadreq_fu_98_p6, ap_CS_fsm_state3, tmp_1_reg_204, ap_block_state1_io, ap_block_state2_io, regslice_both_m_axis_udp_tx_V_data_V_U_apdone_blk, regslice_both_m_axis_udp_tx_meta_V_data_V_U_apdone_blk, ap_block_state3_io, s_axis_udp_rx_TVALID_int_regslice, m_axis_udp_tx_TREADY_int_regslice, s_axis_udp_rx_meta_TVALID_int_regslice, m_axis_udp_tx_meta_TREADY_int_regslice)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_start = ap_const_logic_0) or (ap_const_boolean_1 = ap_block_state1_io) or (ap_done_reg = ap_const_logic_1) or ((tmp_nbreadreq_fu_56_p6 = ap_const_lv1_1) and (m_axis_udp_tx_TREADY_int_regslice = ap_const_logic_0)) or ((tmp_nbreadreq_fu_56_p6 = ap_const_lv1_1) and (s_axis_udp_rx_TVALID_int_regslice = ap_const_logic_0)))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if ((not(((ap_const_boolean_1 = ap_block_state2_io) or ((tmp_1_nbreadreq_fu_98_p6 = ap_const_lv1_1) and (m_axis_udp_tx_meta_TREADY_int_regslice = ap_const_logic_0)) or ((tmp_1_nbreadreq_fu_98_p6 = ap_const_lv1_1) and (s_axis_udp_rx_meta_TVALID_int_regslice = ap_const_logic_0)) or ((tmp_reg_180 = ap_const_lv1_1) and (m_axis_udp_tx_TREADY_int_regslice = ap_const_logic_0)))) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                if ((not(((ap_const_boolean_1 = ap_block_state3_io) or (regslice_both_m_axis_udp_tx_meta_V_data_V_U_apdone_blk = ap_const_logic_1) or (regslice_both_m_axis_udp_tx_V_data_V_U_apdone_blk = ap_const_logic_1) or ((tmp_1_reg_204 = ap_const_lv1_1) and (m_axis_udp_tx_meta_TREADY_int_regslice = ap_const_logic_0)))) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when others =>  
                ap_NS_fsm <= "XXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);

    ap_block_state1_assign_proc : process(ap_start, ap_done_reg, tmp_nbreadreq_fu_56_p6, s_axis_udp_rx_TVALID_int_regslice, m_axis_udp_tx_TREADY_int_regslice)
    begin
                ap_block_state1 <= ((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or ((tmp_nbreadreq_fu_56_p6 = ap_const_lv1_1) and (m_axis_udp_tx_TREADY_int_regslice = ap_const_logic_0)) or ((tmp_nbreadreq_fu_56_p6 = ap_const_lv1_1) and (s_axis_udp_rx_TVALID_int_regslice = ap_const_logic_0)));
    end process;


    ap_block_state1_io_assign_proc : process(tmp_nbreadreq_fu_56_p6, m_axis_udp_tx_TREADY_int_regslice)
    begin
                ap_block_state1_io <= ((tmp_nbreadreq_fu_56_p6 = ap_const_lv1_1) and (m_axis_udp_tx_TREADY_int_regslice = ap_const_logic_0));
    end process;


    ap_block_state2_assign_proc : process(tmp_reg_180, tmp_1_nbreadreq_fu_98_p6, m_axis_udp_tx_TREADY_int_regslice, s_axis_udp_rx_meta_TVALID_int_regslice, m_axis_udp_tx_meta_TREADY_int_regslice)
    begin
                ap_block_state2 <= (((tmp_1_nbreadreq_fu_98_p6 = ap_const_lv1_1) and (m_axis_udp_tx_meta_TREADY_int_regslice = ap_const_logic_0)) or ((tmp_1_nbreadreq_fu_98_p6 = ap_const_lv1_1) and (s_axis_udp_rx_meta_TVALID_int_regslice = ap_const_logic_0)) or ((tmp_reg_180 = ap_const_lv1_1) and (m_axis_udp_tx_TREADY_int_regslice = ap_const_logic_0)));
    end process;


    ap_block_state2_io_assign_proc : process(tmp_reg_180, tmp_1_nbreadreq_fu_98_p6, m_axis_udp_tx_TREADY_int_regslice, m_axis_udp_tx_meta_TREADY_int_regslice)
    begin
                ap_block_state2_io <= (((tmp_1_nbreadreq_fu_98_p6 = ap_const_lv1_1) and (m_axis_udp_tx_meta_TREADY_int_regslice = ap_const_logic_0)) or ((tmp_reg_180 = ap_const_lv1_1) and (m_axis_udp_tx_TREADY_int_regslice = ap_const_logic_0)));
    end process;


    ap_block_state3_assign_proc : process(tmp_1_reg_204, regslice_both_m_axis_udp_tx_V_data_V_U_apdone_blk, regslice_both_m_axis_udp_tx_meta_V_data_V_U_apdone_blk, m_axis_udp_tx_meta_TREADY_int_regslice)
    begin
                ap_block_state3 <= ((regslice_both_m_axis_udp_tx_meta_V_data_V_U_apdone_blk = ap_const_logic_1) or (regslice_both_m_axis_udp_tx_V_data_V_U_apdone_blk = ap_const_logic_1) or ((tmp_1_reg_204 = ap_const_lv1_1) and (m_axis_udp_tx_meta_TREADY_int_regslice = ap_const_logic_0)));
    end process;


    ap_block_state3_io_assign_proc : process(tmp_1_reg_204, m_axis_udp_tx_meta_TREADY_int_regslice)
    begin
                ap_block_state3_io <= ((tmp_1_reg_204 = ap_const_lv1_1) and (m_axis_udp_tx_meta_TREADY_int_regslice = ap_const_logic_0));
    end process;


    ap_done_assign_proc : process(ap_done_reg, ap_CS_fsm_state3, tmp_1_reg_204, regslice_both_m_axis_udp_tx_V_data_V_U_apdone_blk, regslice_both_m_axis_udp_tx_meta_V_data_V_U_apdone_blk, ap_block_state3_io, m_axis_udp_tx_meta_TREADY_int_regslice)
    begin
        if ((not(((ap_const_boolean_1 = ap_block_state3_io) or (regslice_both_m_axis_udp_tx_meta_V_data_V_U_apdone_blk = ap_const_logic_1) or (regslice_both_m_axis_udp_tx_V_data_V_U_apdone_blk = ap_const_logic_1) or ((tmp_1_reg_204 = ap_const_lv1_1) and (m_axis_udp_tx_meta_TREADY_int_regslice = ap_const_logic_0)))) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state3, tmp_1_reg_204, regslice_both_m_axis_udp_tx_V_data_V_U_apdone_blk, regslice_both_m_axis_udp_tx_meta_V_data_V_U_apdone_blk, ap_block_state3_io, m_axis_udp_tx_meta_TREADY_int_regslice)
    begin
        if ((not(((ap_const_boolean_1 = ap_block_state3_io) or (regslice_both_m_axis_udp_tx_meta_V_data_V_U_apdone_blk = ap_const_logic_1) or (regslice_both_m_axis_udp_tx_V_data_V_U_apdone_blk = ap_const_logic_1) or ((tmp_1_reg_204 = ap_const_lv1_1) and (m_axis_udp_tx_meta_TREADY_int_regslice = ap_const_logic_0)))) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    m_axis_udp_tx_TDATA_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, tmp_nbreadreq_fu_56_p6, ap_CS_fsm_state2, tmp_reg_180, m_axis_udp_tx_TREADY_int_regslice)
    begin
        if ((((tmp_reg_180 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2)) or (not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (tmp_nbreadreq_fu_56_p6 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
            m_axis_udp_tx_TDATA_blk_n <= m_axis_udp_tx_TREADY_int_regslice;
        else 
            m_axis_udp_tx_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    m_axis_udp_tx_TVALID <= regslice_both_m_axis_udp_tx_V_data_V_U_vld_out;

    m_axis_udp_tx_TVALID_int_regslice_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, tmp_nbreadreq_fu_56_p6, ap_block_state1_io, s_axis_udp_rx_TVALID_int_regslice, m_axis_udp_tx_TREADY_int_regslice)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_const_boolean_1 = ap_block_state1_io) or (ap_done_reg = ap_const_logic_1) or ((tmp_nbreadreq_fu_56_p6 = ap_const_lv1_1) and (m_axis_udp_tx_TREADY_int_regslice = ap_const_logic_0)) or ((tmp_nbreadreq_fu_56_p6 = ap_const_lv1_1) and (s_axis_udp_rx_TVALID_int_regslice = ap_const_logic_0)))) and (tmp_nbreadreq_fu_56_p6 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            m_axis_udp_tx_TVALID_int_regslice <= ap_const_logic_1;
        else 
            m_axis_udp_tx_TVALID_int_regslice <= ap_const_logic_0;
        end if; 
    end process;


    m_axis_udp_tx_meta_TDATA_blk_n_assign_proc : process(ap_CS_fsm_state2, tmp_1_nbreadreq_fu_98_p6, ap_CS_fsm_state3, tmp_1_reg_204, m_axis_udp_tx_meta_TREADY_int_regslice)
    begin
        if ((((tmp_1_reg_204 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3)) or ((tmp_1_nbreadreq_fu_98_p6 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2)))) then 
            m_axis_udp_tx_meta_TDATA_blk_n <= m_axis_udp_tx_meta_TREADY_int_regslice;
        else 
            m_axis_udp_tx_meta_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    m_axis_udp_tx_meta_TVALID <= regslice_both_m_axis_udp_tx_meta_V_data_V_U_vld_out;

    m_axis_udp_tx_meta_TVALID_int_regslice_assign_proc : process(ap_CS_fsm_state2, tmp_reg_180, tmp_1_nbreadreq_fu_98_p6, ap_block_state2_io, m_axis_udp_tx_TREADY_int_regslice, s_axis_udp_rx_meta_TVALID_int_regslice, m_axis_udp_tx_meta_TREADY_int_regslice)
    begin
        if ((not(((ap_const_boolean_1 = ap_block_state2_io) or ((tmp_1_nbreadreq_fu_98_p6 = ap_const_lv1_1) and (m_axis_udp_tx_meta_TREADY_int_regslice = ap_const_logic_0)) or ((tmp_1_nbreadreq_fu_98_p6 = ap_const_lv1_1) and (s_axis_udp_rx_meta_TVALID_int_regslice = ap_const_logic_0)) or ((tmp_reg_180 = ap_const_lv1_1) and (m_axis_udp_tx_TREADY_int_regslice = ap_const_logic_0)))) and (tmp_1_nbreadreq_fu_98_p6 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            m_axis_udp_tx_meta_TVALID_int_regslice <= ap_const_logic_1;
        else 
            m_axis_udp_tx_meta_TVALID_int_regslice <= ap_const_logic_0;
        end if; 
    end process;


    s_axis_udp_rx_TDATA_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, tmp_nbreadreq_fu_56_p6, s_axis_udp_rx_TVALID_int_regslice)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (tmp_nbreadreq_fu_56_p6 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            s_axis_udp_rx_TDATA_blk_n <= s_axis_udp_rx_TVALID_int_regslice;
        else 
            s_axis_udp_rx_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    s_axis_udp_rx_TREADY <= regslice_both_s_axis_udp_rx_V_data_V_U_ack_in;

    s_axis_udp_rx_TREADY_int_regslice_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, tmp_nbreadreq_fu_56_p6, ap_block_state1_io, s_axis_udp_rx_TVALID_int_regslice, m_axis_udp_tx_TREADY_int_regslice)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_const_boolean_1 = ap_block_state1_io) or (ap_done_reg = ap_const_logic_1) or ((tmp_nbreadreq_fu_56_p6 = ap_const_lv1_1) and (m_axis_udp_tx_TREADY_int_regslice = ap_const_logic_0)) or ((tmp_nbreadreq_fu_56_p6 = ap_const_lv1_1) and (s_axis_udp_rx_TVALID_int_regslice = ap_const_logic_0)))) and (tmp_nbreadreq_fu_56_p6 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            s_axis_udp_rx_TREADY_int_regslice <= ap_const_logic_1;
        else 
            s_axis_udp_rx_TREADY_int_regslice <= ap_const_logic_0;
        end if; 
    end process;


    s_axis_udp_rx_meta_TDATA_blk_n_assign_proc : process(ap_CS_fsm_state2, tmp_1_nbreadreq_fu_98_p6, s_axis_udp_rx_meta_TVALID_int_regslice)
    begin
        if (((tmp_1_nbreadreq_fu_98_p6 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            s_axis_udp_rx_meta_TDATA_blk_n <= s_axis_udp_rx_meta_TVALID_int_regslice;
        else 
            s_axis_udp_rx_meta_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    s_axis_udp_rx_meta_TREADY <= regslice_both_s_axis_udp_rx_meta_V_data_V_U_ack_in;

    s_axis_udp_rx_meta_TREADY_int_regslice_assign_proc : process(ap_CS_fsm_state2, tmp_reg_180, tmp_1_nbreadreq_fu_98_p6, ap_block_state2_io, m_axis_udp_tx_TREADY_int_regslice, s_axis_udp_rx_meta_TVALID_int_regslice, m_axis_udp_tx_meta_TREADY_int_regslice)
    begin
        if ((not(((ap_const_boolean_1 = ap_block_state2_io) or ((tmp_1_nbreadreq_fu_98_p6 = ap_const_lv1_1) and (m_axis_udp_tx_meta_TREADY_int_regslice = ap_const_logic_0)) or ((tmp_1_nbreadreq_fu_98_p6 = ap_const_lv1_1) and (s_axis_udp_rx_meta_TVALID_int_regslice = ap_const_logic_0)) or ((tmp_reg_180 = ap_const_lv1_1) and (m_axis_udp_tx_TREADY_int_regslice = ap_const_logic_0)))) and (tmp_1_nbreadreq_fu_98_p6 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            s_axis_udp_rx_meta_TREADY_int_regslice <= ap_const_logic_1;
        else 
            s_axis_udp_rx_meta_TREADY_int_regslice <= ap_const_logic_0;
        end if; 
    end process;

    tmp_1_nbreadreq_fu_98_p6 <= (0=>(s_axis_udp_rx_meta_TVALID_int_regslice), others=>'-');
    tmp_nbreadreq_fu_56_p6 <= (0=>(s_axis_udp_rx_TVALID_int_regslice), others=>'-');
end behav;
