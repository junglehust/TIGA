-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Version: 2020.2
-- Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity hls_recv_krnl_hls_recv_krnl_entry45 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    start_full_n : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    start_out : OUT STD_LOGIC;
    start_write : OUT STD_LOGIC;
    useConn_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    useConn_empty_n : IN STD_LOGIC;
    useConn_read : OUT STD_LOGIC;
    basePort_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    basePort_empty_n : IN STD_LOGIC;
    basePort_read : OUT STD_LOGIC;
    expectedRxByteCnt_dout : IN STD_LOGIC_VECTOR (63 downto 0);
    expectedRxByteCnt_empty_n : IN STD_LOGIC;
    expectedRxByteCnt_read : OUT STD_LOGIC;
    out_time_dout : IN STD_LOGIC_VECTOR (63 downto 0);
    out_time_empty_n : IN STD_LOGIC;
    out_time_read : OUT STD_LOGIC;
    useConn_out_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    useConn_out_full_n : IN STD_LOGIC;
    useConn_out_write : OUT STD_LOGIC;
    basePort_out_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    basePort_out_full_n : IN STD_LOGIC;
    basePort_out_write : OUT STD_LOGIC;
    expectedRxByteCnt_out_din : OUT STD_LOGIC_VECTOR (63 downto 0);
    expectedRxByteCnt_out_full_n : IN STD_LOGIC;
    expectedRxByteCnt_out_write : OUT STD_LOGIC;
    expectedRxByteCnt_out1_din : OUT STD_LOGIC_VECTOR (63 downto 0);
    expectedRxByteCnt_out1_full_n : IN STD_LOGIC;
    expectedRxByteCnt_out1_write : OUT STD_LOGIC;
    out_time_out_din : OUT STD_LOGIC_VECTOR (63 downto 0);
    out_time_out_full_n : IN STD_LOGIC;
    out_time_out_write : OUT STD_LOGIC );
end;


architecture behav of hls_recv_krnl_hls_recv_krnl_entry45 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;

attribute shreg_extract : string;
    signal real_start : STD_LOGIC;
    signal start_once_reg : STD_LOGIC := '0';
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal internal_ap_ready : STD_LOGIC;
    signal useConn_blk_n : STD_LOGIC;
    signal basePort_blk_n : STD_LOGIC;
    signal expectedRxByteCnt_blk_n : STD_LOGIC;
    signal out_time_blk_n : STD_LOGIC;
    signal useConn_out_blk_n : STD_LOGIC;
    signal basePort_out_blk_n : STD_LOGIC;
    signal expectedRxByteCnt_out_blk_n : STD_LOGIC;
    signal expectedRxByteCnt_out1_blk_n : STD_LOGIC;
    signal out_time_out_blk_n : STD_LOGIC;
    signal ap_block_state1 : BOOLEAN;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_ce_reg : STD_LOGIC;


begin




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
                elsif ((not(((real_start = ap_const_logic_0) or (out_time_out_full_n = ap_const_logic_0) or (expectedRxByteCnt_out1_full_n = ap_const_logic_0) or (expectedRxByteCnt_out_full_n = ap_const_logic_0) or (basePort_out_full_n = ap_const_logic_0) or (useConn_out_full_n = ap_const_logic_0) or (out_time_empty_n = ap_const_logic_0) or (expectedRxByteCnt_empty_n = ap_const_logic_0) or (basePort_empty_n = ap_const_logic_0) or (useConn_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    start_once_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                start_once_reg <= ap_const_logic_0;
            else
                if (((real_start = ap_const_logic_1) and (internal_ap_ready = ap_const_logic_0))) then 
                    start_once_reg <= ap_const_logic_1;
                elsif ((internal_ap_ready = ap_const_logic_1)) then 
                    start_once_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    ap_NS_fsm_assign_proc : process (real_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, useConn_empty_n, basePort_empty_n, expectedRxByteCnt_empty_n, out_time_empty_n, useConn_out_full_n, basePort_out_full_n, expectedRxByteCnt_out_full_n, expectedRxByteCnt_out1_full_n, out_time_out_full_n)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);

    ap_block_state1_assign_proc : process(real_start, ap_done_reg, useConn_empty_n, basePort_empty_n, expectedRxByteCnt_empty_n, out_time_empty_n, useConn_out_full_n, basePort_out_full_n, expectedRxByteCnt_out_full_n, expectedRxByteCnt_out1_full_n, out_time_out_full_n)
    begin
                ap_block_state1 <= ((real_start = ap_const_logic_0) or (out_time_out_full_n = ap_const_logic_0) or (expectedRxByteCnt_out1_full_n = ap_const_logic_0) or (expectedRxByteCnt_out_full_n = ap_const_logic_0) or (basePort_out_full_n = ap_const_logic_0) or (useConn_out_full_n = ap_const_logic_0) or (out_time_empty_n = ap_const_logic_0) or (expectedRxByteCnt_empty_n = ap_const_logic_0) or (basePort_empty_n = ap_const_logic_0) or (useConn_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_done_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, useConn_empty_n, basePort_empty_n, expectedRxByteCnt_empty_n, out_time_empty_n, useConn_out_full_n, basePort_out_full_n, expectedRxByteCnt_out_full_n, expectedRxByteCnt_out1_full_n, out_time_out_full_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (out_time_out_full_n = ap_const_logic_0) or (expectedRxByteCnt_out1_full_n = ap_const_logic_0) or (expectedRxByteCnt_out_full_n = ap_const_logic_0) or (basePort_out_full_n = ap_const_logic_0) or (useConn_out_full_n = ap_const_logic_0) or (out_time_empty_n = ap_const_logic_0) or (expectedRxByteCnt_empty_n = ap_const_logic_0) or (basePort_empty_n = ap_const_logic_0) or (useConn_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(real_start, ap_CS_fsm_state1)
    begin
        if (((real_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;

    ap_ready <= internal_ap_ready;

    basePort_blk_n_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, basePort_empty_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            basePort_blk_n <= basePort_empty_n;
        else 
            basePort_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    basePort_out_blk_n_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, basePort_out_full_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            basePort_out_blk_n <= basePort_out_full_n;
        else 
            basePort_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    basePort_out_din <= basePort_dout;

    basePort_out_write_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, useConn_empty_n, basePort_empty_n, expectedRxByteCnt_empty_n, out_time_empty_n, useConn_out_full_n, basePort_out_full_n, expectedRxByteCnt_out_full_n, expectedRxByteCnt_out1_full_n, out_time_out_full_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (out_time_out_full_n = ap_const_logic_0) or (expectedRxByteCnt_out1_full_n = ap_const_logic_0) or (expectedRxByteCnt_out_full_n = ap_const_logic_0) or (basePort_out_full_n = ap_const_logic_0) or (useConn_out_full_n = ap_const_logic_0) or (out_time_empty_n = ap_const_logic_0) or (expectedRxByteCnt_empty_n = ap_const_logic_0) or (basePort_empty_n = ap_const_logic_0) or (useConn_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            basePort_out_write <= ap_const_logic_1;
        else 
            basePort_out_write <= ap_const_logic_0;
        end if; 
    end process;


    basePort_read_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, useConn_empty_n, basePort_empty_n, expectedRxByteCnt_empty_n, out_time_empty_n, useConn_out_full_n, basePort_out_full_n, expectedRxByteCnt_out_full_n, expectedRxByteCnt_out1_full_n, out_time_out_full_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (out_time_out_full_n = ap_const_logic_0) or (expectedRxByteCnt_out1_full_n = ap_const_logic_0) or (expectedRxByteCnt_out_full_n = ap_const_logic_0) or (basePort_out_full_n = ap_const_logic_0) or (useConn_out_full_n = ap_const_logic_0) or (out_time_empty_n = ap_const_logic_0) or (expectedRxByteCnt_empty_n = ap_const_logic_0) or (basePort_empty_n = ap_const_logic_0) or (useConn_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            basePort_read <= ap_const_logic_1;
        else 
            basePort_read <= ap_const_logic_0;
        end if; 
    end process;


    expectedRxByteCnt_blk_n_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, expectedRxByteCnt_empty_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            expectedRxByteCnt_blk_n <= expectedRxByteCnt_empty_n;
        else 
            expectedRxByteCnt_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    expectedRxByteCnt_out1_blk_n_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, expectedRxByteCnt_out1_full_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            expectedRxByteCnt_out1_blk_n <= expectedRxByteCnt_out1_full_n;
        else 
            expectedRxByteCnt_out1_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    expectedRxByteCnt_out1_din <= expectedRxByteCnt_dout;

    expectedRxByteCnt_out1_write_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, useConn_empty_n, basePort_empty_n, expectedRxByteCnt_empty_n, out_time_empty_n, useConn_out_full_n, basePort_out_full_n, expectedRxByteCnt_out_full_n, expectedRxByteCnt_out1_full_n, out_time_out_full_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (out_time_out_full_n = ap_const_logic_0) or (expectedRxByteCnt_out1_full_n = ap_const_logic_0) or (expectedRxByteCnt_out_full_n = ap_const_logic_0) or (basePort_out_full_n = ap_const_logic_0) or (useConn_out_full_n = ap_const_logic_0) or (out_time_empty_n = ap_const_logic_0) or (expectedRxByteCnt_empty_n = ap_const_logic_0) or (basePort_empty_n = ap_const_logic_0) or (useConn_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            expectedRxByteCnt_out1_write <= ap_const_logic_1;
        else 
            expectedRxByteCnt_out1_write <= ap_const_logic_0;
        end if; 
    end process;


    expectedRxByteCnt_out_blk_n_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, expectedRxByteCnt_out_full_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            expectedRxByteCnt_out_blk_n <= expectedRxByteCnt_out_full_n;
        else 
            expectedRxByteCnt_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    expectedRxByteCnt_out_din <= expectedRxByteCnt_dout;

    expectedRxByteCnt_out_write_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, useConn_empty_n, basePort_empty_n, expectedRxByteCnt_empty_n, out_time_empty_n, useConn_out_full_n, basePort_out_full_n, expectedRxByteCnt_out_full_n, expectedRxByteCnt_out1_full_n, out_time_out_full_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (out_time_out_full_n = ap_const_logic_0) or (expectedRxByteCnt_out1_full_n = ap_const_logic_0) or (expectedRxByteCnt_out_full_n = ap_const_logic_0) or (basePort_out_full_n = ap_const_logic_0) or (useConn_out_full_n = ap_const_logic_0) or (out_time_empty_n = ap_const_logic_0) or (expectedRxByteCnt_empty_n = ap_const_logic_0) or (basePort_empty_n = ap_const_logic_0) or (useConn_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            expectedRxByteCnt_out_write <= ap_const_logic_1;
        else 
            expectedRxByteCnt_out_write <= ap_const_logic_0;
        end if; 
    end process;


    expectedRxByteCnt_read_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, useConn_empty_n, basePort_empty_n, expectedRxByteCnt_empty_n, out_time_empty_n, useConn_out_full_n, basePort_out_full_n, expectedRxByteCnt_out_full_n, expectedRxByteCnt_out1_full_n, out_time_out_full_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (out_time_out_full_n = ap_const_logic_0) or (expectedRxByteCnt_out1_full_n = ap_const_logic_0) or (expectedRxByteCnt_out_full_n = ap_const_logic_0) or (basePort_out_full_n = ap_const_logic_0) or (useConn_out_full_n = ap_const_logic_0) or (out_time_empty_n = ap_const_logic_0) or (expectedRxByteCnt_empty_n = ap_const_logic_0) or (basePort_empty_n = ap_const_logic_0) or (useConn_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            expectedRxByteCnt_read <= ap_const_logic_1;
        else 
            expectedRxByteCnt_read <= ap_const_logic_0;
        end if; 
    end process;


    internal_ap_ready_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, useConn_empty_n, basePort_empty_n, expectedRxByteCnt_empty_n, out_time_empty_n, useConn_out_full_n, basePort_out_full_n, expectedRxByteCnt_out_full_n, expectedRxByteCnt_out1_full_n, out_time_out_full_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (out_time_out_full_n = ap_const_logic_0) or (expectedRxByteCnt_out1_full_n = ap_const_logic_0) or (expectedRxByteCnt_out_full_n = ap_const_logic_0) or (basePort_out_full_n = ap_const_logic_0) or (useConn_out_full_n = ap_const_logic_0) or (out_time_empty_n = ap_const_logic_0) or (expectedRxByteCnt_empty_n = ap_const_logic_0) or (basePort_empty_n = ap_const_logic_0) or (useConn_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            internal_ap_ready <= ap_const_logic_1;
        else 
            internal_ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    out_time_blk_n_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, out_time_empty_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            out_time_blk_n <= out_time_empty_n;
        else 
            out_time_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    out_time_out_blk_n_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, out_time_out_full_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            out_time_out_blk_n <= out_time_out_full_n;
        else 
            out_time_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    out_time_out_din <= out_time_dout;

    out_time_out_write_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, useConn_empty_n, basePort_empty_n, expectedRxByteCnt_empty_n, out_time_empty_n, useConn_out_full_n, basePort_out_full_n, expectedRxByteCnt_out_full_n, expectedRxByteCnt_out1_full_n, out_time_out_full_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (out_time_out_full_n = ap_const_logic_0) or (expectedRxByteCnt_out1_full_n = ap_const_logic_0) or (expectedRxByteCnt_out_full_n = ap_const_logic_0) or (basePort_out_full_n = ap_const_logic_0) or (useConn_out_full_n = ap_const_logic_0) or (out_time_empty_n = ap_const_logic_0) or (expectedRxByteCnt_empty_n = ap_const_logic_0) or (basePort_empty_n = ap_const_logic_0) or (useConn_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            out_time_out_write <= ap_const_logic_1;
        else 
            out_time_out_write <= ap_const_logic_0;
        end if; 
    end process;


    out_time_read_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, useConn_empty_n, basePort_empty_n, expectedRxByteCnt_empty_n, out_time_empty_n, useConn_out_full_n, basePort_out_full_n, expectedRxByteCnt_out_full_n, expectedRxByteCnt_out1_full_n, out_time_out_full_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (out_time_out_full_n = ap_const_logic_0) or (expectedRxByteCnt_out1_full_n = ap_const_logic_0) or (expectedRxByteCnt_out_full_n = ap_const_logic_0) or (basePort_out_full_n = ap_const_logic_0) or (useConn_out_full_n = ap_const_logic_0) or (out_time_empty_n = ap_const_logic_0) or (expectedRxByteCnt_empty_n = ap_const_logic_0) or (basePort_empty_n = ap_const_logic_0) or (useConn_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            out_time_read <= ap_const_logic_1;
        else 
            out_time_read <= ap_const_logic_0;
        end if; 
    end process;


    real_start_assign_proc : process(ap_start, start_full_n, start_once_reg)
    begin
        if (((start_full_n = ap_const_logic_0) and (start_once_reg = ap_const_logic_0))) then 
            real_start <= ap_const_logic_0;
        else 
            real_start <= ap_start;
        end if; 
    end process;

    start_out <= real_start;

    start_write_assign_proc : process(real_start, start_once_reg)
    begin
        if (((real_start = ap_const_logic_1) and (start_once_reg = ap_const_logic_0))) then 
            start_write <= ap_const_logic_1;
        else 
            start_write <= ap_const_logic_0;
        end if; 
    end process;


    useConn_blk_n_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, useConn_empty_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            useConn_blk_n <= useConn_empty_n;
        else 
            useConn_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    useConn_out_blk_n_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, useConn_out_full_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            useConn_out_blk_n <= useConn_out_full_n;
        else 
            useConn_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    useConn_out_din <= useConn_dout;

    useConn_out_write_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, useConn_empty_n, basePort_empty_n, expectedRxByteCnt_empty_n, out_time_empty_n, useConn_out_full_n, basePort_out_full_n, expectedRxByteCnt_out_full_n, expectedRxByteCnt_out1_full_n, out_time_out_full_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (out_time_out_full_n = ap_const_logic_0) or (expectedRxByteCnt_out1_full_n = ap_const_logic_0) or (expectedRxByteCnt_out_full_n = ap_const_logic_0) or (basePort_out_full_n = ap_const_logic_0) or (useConn_out_full_n = ap_const_logic_0) or (out_time_empty_n = ap_const_logic_0) or (expectedRxByteCnt_empty_n = ap_const_logic_0) or (basePort_empty_n = ap_const_logic_0) or (useConn_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            useConn_out_write <= ap_const_logic_1;
        else 
            useConn_out_write <= ap_const_logic_0;
        end if; 
    end process;


    useConn_read_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, useConn_empty_n, basePort_empty_n, expectedRxByteCnt_empty_n, out_time_empty_n, useConn_out_full_n, basePort_out_full_n, expectedRxByteCnt_out_full_n, expectedRxByteCnt_out1_full_n, out_time_out_full_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (out_time_out_full_n = ap_const_logic_0) or (expectedRxByteCnt_out1_full_n = ap_const_logic_0) or (expectedRxByteCnt_out_full_n = ap_const_logic_0) or (basePort_out_full_n = ap_const_logic_0) or (useConn_out_full_n = ap_const_logic_0) or (out_time_empty_n = ap_const_logic_0) or (expectedRxByteCnt_empty_n = ap_const_logic_0) or (basePort_empty_n = ap_const_logic_0) or (useConn_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            useConn_read <= ap_const_logic_1;
        else 
            useConn_read <= ap_const_logic_0;
        end if; 
    end process;

end behav;
