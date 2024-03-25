-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Version: 2020.2
-- Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity hls_recv_krnl_mysha is
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
    timesha_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    timesha_full_n : IN STD_LOGIC;
    timesha_write : OUT STD_LOGIC;
    ComputeWordCnt_loc_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    ComputeWordCnt_loc_empty_n : IN STD_LOGIC;
    ComputeWordCnt_loc_read : OUT STD_LOGIC;
    ComputeWordCnt_loc_out_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    ComputeWordCnt_loc_out_full_n : IN STD_LOGIC;
    ComputeWordCnt_loc_out_write : OUT STD_LOGIC;
    ComputeWordCnt_loc_out1_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    ComputeWordCnt_loc_out1_full_n : IN STD_LOGIC;
    ComputeWordCnt_loc_out1_write : OUT STD_LOGIC;
    sha_in_dout : IN STD_LOGIC_VECTOR (511 downto 0);
    sha_in_empty_n : IN STD_LOGIC;
    sha_in_read : OUT STD_LOGIC;
    sha_out_din : OUT STD_LOGIC_VECTOR (511 downto 0);
    sha_out_full_n : IN STD_LOGIC;
    sha_out_write : OUT STD_LOGIC;
    endMsgLenStrm_dout : IN STD_LOGIC_VECTOR (0 downto 0);
    endMsgLenStrm_empty_n : IN STD_LOGIC;
    endMsgLenStrm_read : OUT STD_LOGIC;
    msgLenStrm_dout : IN STD_LOGIC_VECTOR (127 downto 0);
    msgLenStrm_empty_n : IN STD_LOGIC;
    msgLenStrm_read : OUT STD_LOGIC;
    msgStrm_dout : IN STD_LOGIC_VECTOR (63 downto 0);
    msgStrm_empty_n : IN STD_LOGIC;
    msgStrm_read : OUT STD_LOGIC;
    digestStrm_din : OUT STD_LOGIC_VECTOR (255 downto 0);
    digestStrm_full_n : IN STD_LOGIC;
    digestStrm_write : OUT STD_LOGIC;
    endDigestStrm_din : OUT STD_LOGIC_VECTOR (0 downto 0);
    endDigestStrm_full_n : IN STD_LOGIC;
    endDigestStrm_write : OUT STD_LOGIC );
end;


architecture behav of hls_recv_krnl_mysha is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (3 downto 0) := "0010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (3 downto 0) := "0100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (3 downto 0) := "1000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv33_1FFFFFFFF : STD_LOGIC_VECTOR (32 downto 0) := "111111111111111111111111111111111";
    constant ap_const_boolean_1 : BOOLEAN := true;

attribute shreg_extract : string;
    signal real_start : STD_LOGIC;
    signal start_once_reg : STD_LOGIC := '0';
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal internal_ap_ready : STD_LOGIC;
    signal timesha_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal icmp_ln878_fu_156_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ComputeWordCnt_loc_blk_n : STD_LOGIC;
    signal ComputeWordCnt_loc_out_blk_n : STD_LOGIC;
    signal ComputeWordCnt_loc_out1_blk_n : STD_LOGIC;
    signal sha_in_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal sha_out_blk_n : STD_LOGIC;
    signal sub_i_i_i_i_i_fu_140_p2 : STD_LOGIC_VECTOR (32 downto 0);
    signal sub_i_i_i_i_i_reg_161 : STD_LOGIC_VECTOR (32 downto 0);
    signal add_ln878_fu_146_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln878_reg_166 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_state3 : BOOLEAN;
    signal grp_sha3Digest_32u_s_fu_120_ap_start : STD_LOGIC;
    signal grp_sha3Digest_32u_s_fu_120_ap_done : STD_LOGIC;
    signal grp_sha3Digest_32u_s_fu_120_ap_idle : STD_LOGIC;
    signal grp_sha3Digest_32u_s_fu_120_ap_ready : STD_LOGIC;
    signal grp_sha3Digest_32u_s_fu_120_endMsgLenStrm_read : STD_LOGIC;
    signal grp_sha3Digest_32u_s_fu_120_msgLenStrm_read : STD_LOGIC;
    signal grp_sha3Digest_32u_s_fu_120_msgStrm_read : STD_LOGIC;
    signal grp_sha3Digest_32u_s_fu_120_digestStrm_din : STD_LOGIC_VECTOR (255 downto 0);
    signal grp_sha3Digest_32u_s_fu_120_digestStrm_write : STD_LOGIC;
    signal grp_sha3Digest_32u_s_fu_120_endDigestStrm_din : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_sha3Digest_32u_s_fu_120_endDigestStrm_write : STD_LOGIC;
    signal i_V_reg_109 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_state2 : BOOLEAN;
    signal ap_block_state4 : BOOLEAN;
    signal grp_sha3Digest_32u_s_fu_120_ap_start_reg : STD_LOGIC := '0';
    signal ap_block_state1_ignore_call54 : BOOLEAN;
    signal ap_block_state3_ignore_call4 : BOOLEAN;
    signal ComputeWordCnt_cast_i_i_i_fu_136_p1 : STD_LOGIC_VECTOR (32 downto 0);
    signal zext_ln110_fu_152_p1 : STD_LOGIC_VECTOR (32 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_block_state1 : BOOLEAN;
    signal ap_ce_reg : STD_LOGIC;

    component hls_recv_krnl_sha3Digest_32u_s IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        endMsgLenStrm_dout : IN STD_LOGIC_VECTOR (0 downto 0);
        endMsgLenStrm_empty_n : IN STD_LOGIC;
        endMsgLenStrm_read : OUT STD_LOGIC;
        msgLenStrm_dout : IN STD_LOGIC_VECTOR (127 downto 0);
        msgLenStrm_empty_n : IN STD_LOGIC;
        msgLenStrm_read : OUT STD_LOGIC;
        msgStrm_dout : IN STD_LOGIC_VECTOR (63 downto 0);
        msgStrm_empty_n : IN STD_LOGIC;
        msgStrm_read : OUT STD_LOGIC;
        digestStrm_din : OUT STD_LOGIC_VECTOR (255 downto 0);
        digestStrm_full_n : IN STD_LOGIC;
        digestStrm_write : OUT STD_LOGIC;
        endDigestStrm_din : OUT STD_LOGIC_VECTOR (0 downto 0);
        endDigestStrm_full_n : IN STD_LOGIC;
        endDigestStrm_write : OUT STD_LOGIC );
    end component;



begin
    grp_sha3Digest_32u_s_fu_120 : component hls_recv_krnl_sha3Digest_32u_s
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_sha3Digest_32u_s_fu_120_ap_start,
        ap_done => grp_sha3Digest_32u_s_fu_120_ap_done,
        ap_idle => grp_sha3Digest_32u_s_fu_120_ap_idle,
        ap_ready => grp_sha3Digest_32u_s_fu_120_ap_ready,
        endMsgLenStrm_dout => endMsgLenStrm_dout,
        endMsgLenStrm_empty_n => endMsgLenStrm_empty_n,
        endMsgLenStrm_read => grp_sha3Digest_32u_s_fu_120_endMsgLenStrm_read,
        msgLenStrm_dout => msgLenStrm_dout,
        msgLenStrm_empty_n => msgLenStrm_empty_n,
        msgLenStrm_read => grp_sha3Digest_32u_s_fu_120_msgLenStrm_read,
        msgStrm_dout => msgStrm_dout,
        msgStrm_empty_n => msgStrm_empty_n,
        msgStrm_read => grp_sha3Digest_32u_s_fu_120_msgStrm_read,
        digestStrm_din => grp_sha3Digest_32u_s_fu_120_digestStrm_din,
        digestStrm_full_n => digestStrm_full_n,
        digestStrm_write => grp_sha3Digest_32u_s_fu_120_digestStrm_write,
        endDigestStrm_din => grp_sha3Digest_32u_s_fu_120_endDigestStrm_din,
        endDigestStrm_full_n => endDigestStrm_full_n,
        endDigestStrm_write => grp_sha3Digest_32u_s_fu_120_endDigestStrm_write);





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
                elsif ((not(((icmp_ln878_fu_156_p2 = ap_const_lv1_0) and (timesha_full_n = ap_const_logic_0))) and (icmp_ln878_fu_156_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    grp_sha3Digest_32u_s_fu_120_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_sha3Digest_32u_s_fu_120_ap_start_reg <= ap_const_logic_0;
            else
                if (((not(((ap_done_reg = ap_const_logic_1) or (real_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1)) or (not(((icmp_ln878_fu_156_p2 = ap_const_lv1_0) and (timesha_full_n = ap_const_logic_0))) and (icmp_ln878_fu_156_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3)))) then 
                    grp_sha3Digest_32u_s_fu_120_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_sha3Digest_32u_s_fu_120_ap_ready = ap_const_logic_1)) then 
                    grp_sha3Digest_32u_s_fu_120_ap_start_reg <= ap_const_logic_0;
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
                if (((internal_ap_ready = ap_const_logic_0) and (real_start = ap_const_logic_1))) then 
                    start_once_reg <= ap_const_logic_1;
                elsif ((internal_ap_ready = ap_const_logic_1)) then 
                    start_once_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    i_V_reg_109_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((sha_out_full_n = ap_const_logic_0) or (sha_in_empty_n = ap_const_logic_0) or (grp_sha3Digest_32u_s_fu_120_ap_done = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state4))) then 
                i_V_reg_109 <= add_ln878_reg_166;
            elsif ((not(((sha_out_full_n = ap_const_logic_0) or (sha_in_empty_n = ap_const_logic_0) or (timesha_full_n = ap_const_logic_0) or (ap_const_logic_0 = ComputeWordCnt_loc_out1_full_n) or (ap_const_logic_0 = ComputeWordCnt_loc_out_full_n) or (ap_const_logic_0 = ComputeWordCnt_loc_empty_n) or (grp_sha3Digest_32u_s_fu_120_ap_done = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                i_V_reg_109 <= ap_const_lv32_0;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((icmp_ln878_fu_156_p2 = ap_const_lv1_0) and (timesha_full_n = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                add_ln878_reg_166 <= add_ln878_fu_146_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                sub_i_i_i_i_i_reg_161 <= sub_i_i_i_i_i_fu_140_p2;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (real_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, timesha_full_n, ComputeWordCnt_loc_empty_n, ComputeWordCnt_loc_out_full_n, ComputeWordCnt_loc_out1_full_n, sha_in_empty_n, sha_out_full_n, ap_CS_fsm_state2, ap_CS_fsm_state3, icmp_ln878_fu_156_p2, ap_CS_fsm_state4, grp_sha3Digest_32u_s_fu_120_ap_done)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_done_reg = ap_const_logic_1) or (real_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if ((not(((sha_out_full_n = ap_const_logic_0) or (sha_in_empty_n = ap_const_logic_0) or (timesha_full_n = ap_const_logic_0) or (ap_const_logic_0 = ComputeWordCnt_loc_out1_full_n) or (ap_const_logic_0 = ComputeWordCnt_loc_out_full_n) or (ap_const_logic_0 = ComputeWordCnt_loc_empty_n) or (grp_sha3Digest_32u_s_fu_120_ap_done = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                if ((not(((icmp_ln878_fu_156_p2 = ap_const_lv1_0) and (timesha_full_n = ap_const_logic_0))) and (icmp_ln878_fu_156_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                elsif ((not(((icmp_ln878_fu_156_p2 = ap_const_lv1_0) and (timesha_full_n = ap_const_logic_0))) and (icmp_ln878_fu_156_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state4;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state4 => 
                if ((not(((sha_out_full_n = ap_const_logic_0) or (sha_in_empty_n = ap_const_logic_0) or (grp_sha3Digest_32u_s_fu_120_ap_done = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state4))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXX";
        end case;
    end process;
    ComputeWordCnt_cast_i_i_i_fu_136_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ComputeWordCnt_loc_dout),33));

    ComputeWordCnt_loc_blk_n_assign_proc : process(ComputeWordCnt_loc_empty_n, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            ComputeWordCnt_loc_blk_n <= ComputeWordCnt_loc_empty_n;
        else 
            ComputeWordCnt_loc_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    ComputeWordCnt_loc_out1_blk_n_assign_proc : process(ComputeWordCnt_loc_out1_full_n, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            ComputeWordCnt_loc_out1_blk_n <= ComputeWordCnt_loc_out1_full_n;
        else 
            ComputeWordCnt_loc_out1_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    ComputeWordCnt_loc_out1_din <= ComputeWordCnt_loc_dout;

    ComputeWordCnt_loc_out1_write_assign_proc : process(timesha_full_n, ComputeWordCnt_loc_empty_n, ComputeWordCnt_loc_out_full_n, ComputeWordCnt_loc_out1_full_n, sha_in_empty_n, sha_out_full_n, ap_CS_fsm_state2, grp_sha3Digest_32u_s_fu_120_ap_done)
    begin
        if ((not(((sha_out_full_n = ap_const_logic_0) or (sha_in_empty_n = ap_const_logic_0) or (timesha_full_n = ap_const_logic_0) or (ap_const_logic_0 = ComputeWordCnt_loc_out1_full_n) or (ap_const_logic_0 = ComputeWordCnt_loc_out_full_n) or (ap_const_logic_0 = ComputeWordCnt_loc_empty_n) or (grp_sha3Digest_32u_s_fu_120_ap_done = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ComputeWordCnt_loc_out1_write <= ap_const_logic_1;
        else 
            ComputeWordCnt_loc_out1_write <= ap_const_logic_0;
        end if; 
    end process;


    ComputeWordCnt_loc_out_blk_n_assign_proc : process(ComputeWordCnt_loc_out_full_n, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            ComputeWordCnt_loc_out_blk_n <= ComputeWordCnt_loc_out_full_n;
        else 
            ComputeWordCnt_loc_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    ComputeWordCnt_loc_out_din <= ComputeWordCnt_loc_dout;

    ComputeWordCnt_loc_out_write_assign_proc : process(timesha_full_n, ComputeWordCnt_loc_empty_n, ComputeWordCnt_loc_out_full_n, ComputeWordCnt_loc_out1_full_n, sha_in_empty_n, sha_out_full_n, ap_CS_fsm_state2, grp_sha3Digest_32u_s_fu_120_ap_done)
    begin
        if ((not(((sha_out_full_n = ap_const_logic_0) or (sha_in_empty_n = ap_const_logic_0) or (timesha_full_n = ap_const_logic_0) or (ap_const_logic_0 = ComputeWordCnt_loc_out1_full_n) or (ap_const_logic_0 = ComputeWordCnt_loc_out_full_n) or (ap_const_logic_0 = ComputeWordCnt_loc_empty_n) or (grp_sha3Digest_32u_s_fu_120_ap_done = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ComputeWordCnt_loc_out_write <= ap_const_logic_1;
        else 
            ComputeWordCnt_loc_out_write <= ap_const_logic_0;
        end if; 
    end process;


    ComputeWordCnt_loc_read_assign_proc : process(timesha_full_n, ComputeWordCnt_loc_empty_n, ComputeWordCnt_loc_out_full_n, ComputeWordCnt_loc_out1_full_n, sha_in_empty_n, sha_out_full_n, ap_CS_fsm_state2, grp_sha3Digest_32u_s_fu_120_ap_done)
    begin
        if ((not(((sha_out_full_n = ap_const_logic_0) or (sha_in_empty_n = ap_const_logic_0) or (timesha_full_n = ap_const_logic_0) or (ap_const_logic_0 = ComputeWordCnt_loc_out1_full_n) or (ap_const_logic_0 = ComputeWordCnt_loc_out_full_n) or (ap_const_logic_0 = ComputeWordCnt_loc_empty_n) or (grp_sha3Digest_32u_s_fu_120_ap_done = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ComputeWordCnt_loc_read <= ap_const_logic_1;
        else 
            ComputeWordCnt_loc_read <= ap_const_logic_0;
        end if; 
    end process;

    add_ln878_fu_146_p2 <= std_logic_vector(unsigned(i_V_reg_109) + unsigned(ap_const_lv32_1));
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);

    ap_block_state1_assign_proc : process(real_start, ap_done_reg)
    begin
                ap_block_state1 <= ((ap_done_reg = ap_const_logic_1) or (real_start = ap_const_logic_0));
    end process;


    ap_block_state1_ignore_call54_assign_proc : process(real_start, ap_done_reg)
    begin
                ap_block_state1_ignore_call54 <= ((ap_done_reg = ap_const_logic_1) or (real_start = ap_const_logic_0));
    end process;


    ap_block_state2_assign_proc : process(timesha_full_n, ComputeWordCnt_loc_empty_n, ComputeWordCnt_loc_out_full_n, ComputeWordCnt_loc_out1_full_n, sha_in_empty_n, sha_out_full_n)
    begin
                ap_block_state2 <= ((sha_out_full_n = ap_const_logic_0) or (sha_in_empty_n = ap_const_logic_0) or (timesha_full_n = ap_const_logic_0) or (ap_const_logic_0 = ComputeWordCnt_loc_out1_full_n) or (ap_const_logic_0 = ComputeWordCnt_loc_out_full_n) or (ap_const_logic_0 = ComputeWordCnt_loc_empty_n));
    end process;


    ap_block_state3_assign_proc : process(timesha_full_n, icmp_ln878_fu_156_p2)
    begin
                ap_block_state3 <= ((icmp_ln878_fu_156_p2 = ap_const_lv1_0) and (timesha_full_n = ap_const_logic_0));
    end process;


    ap_block_state3_ignore_call4_assign_proc : process(timesha_full_n, icmp_ln878_fu_156_p2)
    begin
                ap_block_state3_ignore_call4 <= ((icmp_ln878_fu_156_p2 = ap_const_lv1_0) and (timesha_full_n = ap_const_logic_0));
    end process;


    ap_block_state4_assign_proc : process(sha_in_empty_n, sha_out_full_n)
    begin
                ap_block_state4 <= ((sha_out_full_n = ap_const_logic_0) or (sha_in_empty_n = ap_const_logic_0));
    end process;


    ap_done_assign_proc : process(ap_done_reg, timesha_full_n, ap_CS_fsm_state3, icmp_ln878_fu_156_p2)
    begin
        if ((not(((icmp_ln878_fu_156_p2 = ap_const_lv1_0) and (timesha_full_n = ap_const_logic_0))) and (icmp_ln878_fu_156_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(real_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (real_start = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;

    ap_ready <= internal_ap_ready;
    digestStrm_din <= grp_sha3Digest_32u_s_fu_120_digestStrm_din;

    digestStrm_write_assign_proc : process(ap_CS_fsm_state2, ap_CS_fsm_state4, grp_sha3Digest_32u_s_fu_120_digestStrm_write)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) or (ap_const_logic_1 = ap_CS_fsm_state4))) then 
            digestStrm_write <= grp_sha3Digest_32u_s_fu_120_digestStrm_write;
        else 
            digestStrm_write <= ap_const_logic_0;
        end if; 
    end process;

    endDigestStrm_din <= grp_sha3Digest_32u_s_fu_120_endDigestStrm_din;

    endDigestStrm_write_assign_proc : process(ap_CS_fsm_state2, ap_CS_fsm_state4, grp_sha3Digest_32u_s_fu_120_endDigestStrm_write)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) or (ap_const_logic_1 = ap_CS_fsm_state4))) then 
            endDigestStrm_write <= grp_sha3Digest_32u_s_fu_120_endDigestStrm_write;
        else 
            endDigestStrm_write <= ap_const_logic_0;
        end if; 
    end process;


    endMsgLenStrm_read_assign_proc : process(ap_CS_fsm_state2, ap_CS_fsm_state4, grp_sha3Digest_32u_s_fu_120_endMsgLenStrm_read)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) or (ap_const_logic_1 = ap_CS_fsm_state4))) then 
            endMsgLenStrm_read <= grp_sha3Digest_32u_s_fu_120_endMsgLenStrm_read;
        else 
            endMsgLenStrm_read <= ap_const_logic_0;
        end if; 
    end process;

    grp_sha3Digest_32u_s_fu_120_ap_start <= grp_sha3Digest_32u_s_fu_120_ap_start_reg;
    icmp_ln878_fu_156_p2 <= "1" when (signed(zext_ln110_fu_152_p1) < signed(sub_i_i_i_i_i_reg_161)) else "0";

    internal_ap_ready_assign_proc : process(timesha_full_n, ap_CS_fsm_state3, icmp_ln878_fu_156_p2)
    begin
        if ((not(((icmp_ln878_fu_156_p2 = ap_const_lv1_0) and (timesha_full_n = ap_const_logic_0))) and (icmp_ln878_fu_156_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            internal_ap_ready <= ap_const_logic_1;
        else 
            internal_ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    msgLenStrm_read_assign_proc : process(ap_CS_fsm_state2, ap_CS_fsm_state4, grp_sha3Digest_32u_s_fu_120_msgLenStrm_read)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) or (ap_const_logic_1 = ap_CS_fsm_state4))) then 
            msgLenStrm_read <= grp_sha3Digest_32u_s_fu_120_msgLenStrm_read;
        else 
            msgLenStrm_read <= ap_const_logic_0;
        end if; 
    end process;


    msgStrm_read_assign_proc : process(ap_CS_fsm_state2, ap_CS_fsm_state4, grp_sha3Digest_32u_s_fu_120_msgStrm_read)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) or (ap_const_logic_1 = ap_CS_fsm_state4))) then 
            msgStrm_read <= grp_sha3Digest_32u_s_fu_120_msgStrm_read;
        else 
            msgStrm_read <= ap_const_logic_0;
        end if; 
    end process;


    real_start_assign_proc : process(ap_start, start_full_n, start_once_reg)
    begin
        if (((start_once_reg = ap_const_logic_0) and (start_full_n = ap_const_logic_0))) then 
            real_start <= ap_const_logic_0;
        else 
            real_start <= ap_start;
        end if; 
    end process;


    sha_in_blk_n_assign_proc : process(sha_in_empty_n, ap_CS_fsm_state2, ap_CS_fsm_state4)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) or (ap_const_logic_1 = ap_CS_fsm_state4))) then 
            sha_in_blk_n <= sha_in_empty_n;
        else 
            sha_in_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    sha_in_read_assign_proc : process(timesha_full_n, ComputeWordCnt_loc_empty_n, ComputeWordCnt_loc_out_full_n, ComputeWordCnt_loc_out1_full_n, sha_in_empty_n, sha_out_full_n, ap_CS_fsm_state2, ap_CS_fsm_state4, grp_sha3Digest_32u_s_fu_120_ap_done)
    begin
        if (((not(((sha_out_full_n = ap_const_logic_0) or (sha_in_empty_n = ap_const_logic_0) or (grp_sha3Digest_32u_s_fu_120_ap_done = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state4)) or (not(((sha_out_full_n = ap_const_logic_0) or (sha_in_empty_n = ap_const_logic_0) or (timesha_full_n = ap_const_logic_0) or (ap_const_logic_0 = ComputeWordCnt_loc_out1_full_n) or (ap_const_logic_0 = ComputeWordCnt_loc_out_full_n) or (ap_const_logic_0 = ComputeWordCnt_loc_empty_n) or (grp_sha3Digest_32u_s_fu_120_ap_done = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state2)))) then 
            sha_in_read <= ap_const_logic_1;
        else 
            sha_in_read <= ap_const_logic_0;
        end if; 
    end process;


    sha_out_blk_n_assign_proc : process(sha_out_full_n, ap_CS_fsm_state2, ap_CS_fsm_state4)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) or (ap_const_logic_1 = ap_CS_fsm_state4))) then 
            sha_out_blk_n <= sha_out_full_n;
        else 
            sha_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    sha_out_din <= sha_in_dout;

    sha_out_write_assign_proc : process(timesha_full_n, ComputeWordCnt_loc_empty_n, ComputeWordCnt_loc_out_full_n, ComputeWordCnt_loc_out1_full_n, sha_in_empty_n, sha_out_full_n, ap_CS_fsm_state2, ap_CS_fsm_state4, grp_sha3Digest_32u_s_fu_120_ap_done)
    begin
        if (((not(((sha_out_full_n = ap_const_logic_0) or (sha_in_empty_n = ap_const_logic_0) or (grp_sha3Digest_32u_s_fu_120_ap_done = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state4)) or (not(((sha_out_full_n = ap_const_logic_0) or (sha_in_empty_n = ap_const_logic_0) or (timesha_full_n = ap_const_logic_0) or (ap_const_logic_0 = ComputeWordCnt_loc_out1_full_n) or (ap_const_logic_0 = ComputeWordCnt_loc_out_full_n) or (ap_const_logic_0 = ComputeWordCnt_loc_empty_n) or (grp_sha3Digest_32u_s_fu_120_ap_done = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state2)))) then 
            sha_out_write <= ap_const_logic_1;
        else 
            sha_out_write <= ap_const_logic_0;
        end if; 
    end process;

    start_out <= real_start;

    start_write_assign_proc : process(real_start, start_once_reg)
    begin
        if (((start_once_reg = ap_const_logic_0) and (real_start = ap_const_logic_1))) then 
            start_write <= ap_const_logic_1;
        else 
            start_write <= ap_const_logic_0;
        end if; 
    end process;

    sub_i_i_i_i_i_fu_140_p2 <= std_logic_vector(unsigned(ComputeWordCnt_cast_i_i_i_fu_136_p1) + unsigned(ap_const_lv33_1FFFFFFFF));

    timesha_blk_n_assign_proc : process(timesha_full_n, ap_CS_fsm_state2, ap_CS_fsm_state3, icmp_ln878_fu_156_p2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) or ((icmp_ln878_fu_156_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3)))) then 
            timesha_blk_n <= timesha_full_n;
        else 
            timesha_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    timesha_din_assign_proc : process(timesha_full_n, ComputeWordCnt_loc_empty_n, ComputeWordCnt_loc_out_full_n, ComputeWordCnt_loc_out1_full_n, sha_in_empty_n, sha_out_full_n, ap_CS_fsm_state2, ap_CS_fsm_state3, icmp_ln878_fu_156_p2, grp_sha3Digest_32u_s_fu_120_ap_done)
    begin
        if ((not(((icmp_ln878_fu_156_p2 = ap_const_lv1_0) and (timesha_full_n = ap_const_logic_0))) and (icmp_ln878_fu_156_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            timesha_din <= ap_const_lv32_1;
        elsif ((not(((sha_out_full_n = ap_const_logic_0) or (sha_in_empty_n = ap_const_logic_0) or (timesha_full_n = ap_const_logic_0) or (ap_const_logic_0 = ComputeWordCnt_loc_out1_full_n) or (ap_const_logic_0 = ComputeWordCnt_loc_out_full_n) or (ap_const_logic_0 = ComputeWordCnt_loc_empty_n) or (grp_sha3Digest_32u_s_fu_120_ap_done = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            timesha_din <= ap_const_lv32_0;
        else 
            timesha_din <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    timesha_write_assign_proc : process(timesha_full_n, ComputeWordCnt_loc_empty_n, ComputeWordCnt_loc_out_full_n, ComputeWordCnt_loc_out1_full_n, sha_in_empty_n, sha_out_full_n, ap_CS_fsm_state2, ap_CS_fsm_state3, icmp_ln878_fu_156_p2, grp_sha3Digest_32u_s_fu_120_ap_done)
    begin
        if (((not(((sha_out_full_n = ap_const_logic_0) or (sha_in_empty_n = ap_const_logic_0) or (timesha_full_n = ap_const_logic_0) or (ap_const_logic_0 = ComputeWordCnt_loc_out1_full_n) or (ap_const_logic_0 = ComputeWordCnt_loc_out_full_n) or (ap_const_logic_0 = ComputeWordCnt_loc_empty_n) or (grp_sha3Digest_32u_s_fu_120_ap_done = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state2)) or (not(((icmp_ln878_fu_156_p2 = ap_const_lv1_0) and (timesha_full_n = ap_const_logic_0))) and (icmp_ln878_fu_156_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3)))) then 
            timesha_write <= ap_const_logic_1;
        else 
            timesha_write <= ap_const_logic_0;
        end if; 
    end process;

    zext_ln110_fu_152_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(i_V_reg_109),33));
end behav;
