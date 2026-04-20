-- Copyright (C) 2021  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 21.1.0 Build 842 10/21/2021 SJ Lite Edition"

-- DATE "03/24/2026 13:52:00"

-- 
-- Device: Altera EP4CE6E22C6 Package TQFP144
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_101,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	ESAME IS
    PORT (
	clk : IN std_logic;
	res : IN std_logic;
	x : IN std_logic_vector(7 DOWNTO 0);
	wave : OUT std_logic
	);
END ESAME;

-- Design Ports Information
-- wave	=>  Location: PIN_135,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res	=>  Location: PIN_24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x[4]	=>  Location: PIN_90,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x[5]	=>  Location: PIN_91,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x[6]	=>  Location: PIN_136,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x[7]	=>  Location: PIN_138,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x[2]	=>  Location: PIN_142,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x[3]	=>  Location: PIN_143,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x[0]	=>  Location: PIN_137,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- x[1]	=>  Location: PIN_141,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ESAME IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_res : std_logic;
SIGNAL ww_x : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_wave : std_logic;
SIGNAL \res~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \wave~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \fsm_inst|counter_inst|count[0]~2_combout\ : std_logic;
SIGNAL \res~input_o\ : std_logic;
SIGNAL \fsm_inst|counter_inst|res_count~combout\ : std_logic;
SIGNAL \fsm_inst|counter_inst|count[1]~1_combout\ : std_logic;
SIGNAL \fsm_inst|counter_inst|count[2]~0_combout\ : std_logic;
SIGNAL \fsm_inst|Selector1~0_combout\ : std_logic;
SIGNAL \fsm_inst|Selector1~1_combout\ : std_logic;
SIGNAL \res~inputclkctrl_outclk\ : std_logic;
SIGNAL \fsm_inst|state.wave_out~q\ : std_logic;
SIGNAL \fsm_inst|Selector0~0_combout\ : std_logic;
SIGNAL \x[7]~input_o\ : std_logic;
SIGNAL \fsm_inst|event_on_x_inst|x_reg[7]~29_combout\ : std_logic;
SIGNAL \fsm_inst|event_on_x_inst|x_reg[7]~31_combout\ : std_logic;
SIGNAL \fsm_inst|event_on_x_inst|x_reg[7]~_emulated_q\ : std_logic;
SIGNAL \fsm_inst|event_on_x_inst|x_reg[7]~30_combout\ : std_logic;
SIGNAL \x[6]~input_o\ : std_logic;
SIGNAL \fsm_inst|event_on_x_inst|x_reg[6]~25_combout\ : std_logic;
SIGNAL \fsm_inst|event_on_x_inst|x_reg[6]~27_combout\ : std_logic;
SIGNAL \fsm_inst|event_on_x_inst|x_reg[6]~_emulated_q\ : std_logic;
SIGNAL \fsm_inst|event_on_x_inst|x_reg[6]~26_combout\ : std_logic;
SIGNAL \fsm_inst|event_on_x_inst|Equal0~3_combout\ : std_logic;
SIGNAL \x[1]~input_o\ : std_logic;
SIGNAL \fsm_inst|event_on_x_inst|x_reg[1]~5_combout\ : std_logic;
SIGNAL \fsm_inst|event_on_x_inst|x_reg[1]~7_combout\ : std_logic;
SIGNAL \fsm_inst|event_on_x_inst|x_reg[1]~_emulated_q\ : std_logic;
SIGNAL \fsm_inst|event_on_x_inst|x_reg[1]~6_combout\ : std_logic;
SIGNAL \x[0]~input_o\ : std_logic;
SIGNAL \fsm_inst|event_on_x_inst|x_reg[0]~1_combout\ : std_logic;
SIGNAL \fsm_inst|event_on_x_inst|x_reg[0]~3_combout\ : std_logic;
SIGNAL \fsm_inst|event_on_x_inst|x_reg[0]~_emulated_q\ : std_logic;
SIGNAL \fsm_inst|event_on_x_inst|x_reg[0]~2_combout\ : std_logic;
SIGNAL \fsm_inst|event_on_x_inst|Equal0~0_combout\ : std_logic;
SIGNAL \x[4]~input_o\ : std_logic;
SIGNAL \x[5]~input_o\ : std_logic;
SIGNAL \fsm_inst|event_on_x_inst|x_reg[5]~21_combout\ : std_logic;
SIGNAL \fsm_inst|event_on_x_inst|x_reg[5]~23_combout\ : std_logic;
SIGNAL \fsm_inst|event_on_x_inst|x_reg[5]~_emulated_q\ : std_logic;
SIGNAL \fsm_inst|event_on_x_inst|x_reg[5]~22_combout\ : std_logic;
SIGNAL \fsm_inst|event_on_x_inst|x_reg[4]~17_combout\ : std_logic;
SIGNAL \fsm_inst|event_on_x_inst|x_reg[4]~19_combout\ : std_logic;
SIGNAL \fsm_inst|event_on_x_inst|x_reg[4]~_emulated_q\ : std_logic;
SIGNAL \fsm_inst|event_on_x_inst|x_reg[4]~18_combout\ : std_logic;
SIGNAL \fsm_inst|event_on_x_inst|Equal0~2_combout\ : std_logic;
SIGNAL \x[3]~input_o\ : std_logic;
SIGNAL \fsm_inst|event_on_x_inst|x_reg[3]~13_combout\ : std_logic;
SIGNAL \fsm_inst|event_on_x_inst|x_reg[3]~15_combout\ : std_logic;
SIGNAL \fsm_inst|event_on_x_inst|x_reg[3]~_emulated_q\ : std_logic;
SIGNAL \fsm_inst|event_on_x_inst|x_reg[3]~14_combout\ : std_logic;
SIGNAL \x[2]~input_o\ : std_logic;
SIGNAL \fsm_inst|event_on_x_inst|x_reg[2]~9_combout\ : std_logic;
SIGNAL \fsm_inst|event_on_x_inst|x_reg[2]~11_combout\ : std_logic;
SIGNAL \fsm_inst|event_on_x_inst|x_reg[2]~_emulated_q\ : std_logic;
SIGNAL \fsm_inst|event_on_x_inst|x_reg[2]~10_combout\ : std_logic;
SIGNAL \fsm_inst|event_on_x_inst|Equal0~1_combout\ : std_logic;
SIGNAL \fsm_inst|event_on_x_inst|Equal0~4_combout\ : std_logic;
SIGNAL \fsm_inst|Selector0~1_combout\ : std_logic;
SIGNAL \fsm_inst|state.idle~q\ : std_logic;
SIGNAL \fsm_inst|nstate.find_ij~0_combout\ : std_logic;
SIGNAL \fsm_inst|state.find_ij~q\ : std_logic;
SIGNAL \fsm_inst|state.wave_gen~feeder_combout\ : std_logic;
SIGNAL \fsm_inst|state.wave_gen~q\ : std_logic;
SIGNAL \finder_inst|rc_ij:first_var[2]~0_combout\ : std_logic;
SIGNAL \finder_inst|rc_ij:first_var[2]~1_combout\ : std_logic;
SIGNAL \finder_inst|rc_ij:first_var[2]~2_combout\ : std_logic;
SIGNAL \finder_inst|rc_ij:last_var[1]~0_combout\ : std_logic;
SIGNAL \finder_inst|rc_ij:last_var[1]~1_combout\ : std_logic;
SIGNAL \finder_inst|rc_ij:first_var[0]~1_combout\ : std_logic;
SIGNAL \finder_inst|rc_ij:first_var[0]~0_combout\ : std_logic;
SIGNAL \finder_inst|rc_ij:first_var[0]~2_combout\ : std_logic;
SIGNAL \finder_inst|rc_ij:first_var[1]~0_combout\ : std_logic;
SIGNAL \finder_inst|rc_ij:first_var[1]~1_combout\ : std_logic;
SIGNAL \wave_out_inst|q_regs~13_combout\ : std_logic;
SIGNAL \finder_inst|rc_ij:last_var[0]~0_combout\ : std_logic;
SIGNAL \finder_inst|rc_ij:last_var[0]~1_combout\ : std_logic;
SIGNAL \wave_out_inst|q_regs~15_combout\ : std_logic;
SIGNAL \wave_out_inst|q_regs~16_combout\ : std_logic;
SIGNAL \wave_out_inst|q_regs~14_combout\ : std_logic;
SIGNAL \wave_out_inst|q_regs[0]~2_combout\ : std_logic;
SIGNAL \wave_out_inst|q_regs~11_combout\ : std_logic;
SIGNAL \wave_out_inst|q_regs~12_combout\ : std_logic;
SIGNAL \wave_out_inst|q_regs~9_combout\ : std_logic;
SIGNAL \wave_out_inst|q_regs~10_combout\ : std_logic;
SIGNAL \wave_out_inst|q_regs~7_combout\ : std_logic;
SIGNAL \wave_out_inst|q_regs~8_combout\ : std_logic;
SIGNAL \wave_out_inst|q_regs~5_combout\ : std_logic;
SIGNAL \wave_out_inst|q_regs~6_combout\ : std_logic;
SIGNAL \wave_out_inst|q_regs~3_combout\ : std_logic;
SIGNAL \wave_out_inst|q_regs~4_combout\ : std_logic;
SIGNAL \wave_out_inst|q_regs~0_combout\ : std_logic;
SIGNAL \wave_out_inst|q_regs~1_combout\ : std_logic;
SIGNAL \fsm_inst|counter_inst|count\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \wave_out_inst|q_regs\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \finder_inst|first_reg\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \finder_inst|last_reg\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \ALT_INV_res~inputclkctrl_outclk\ : std_logic;
SIGNAL \fsm_inst|counter_inst|ALT_INV_res_count~combout\ : std_logic;
SIGNAL \fsm_inst|ALT_INV_state.idle~q\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk <= clk;
ww_res <= res;
ww_x <= x;
wave <= ww_wave;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\res~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \res~input_o\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_res~inputclkctrl_outclk\ <= NOT \res~inputclkctrl_outclk\;
\fsm_inst|counter_inst|ALT_INV_res_count~combout\ <= NOT \fsm_inst|counter_inst|res_count~combout\;
\fsm_inst|ALT_INV_state.idle~q\ <= NOT \fsm_inst|state.idle~q\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X11_Y24_N16
\wave~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \wave_out_inst|q_regs\(0),
	devoe => ww_devoe,
	o => \wave~output_o\);

-- Location: IOIBUF_X0_Y11_N8
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G2
\clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: LCCOMB_X6_Y20_N8
\fsm_inst|counter_inst|count[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|counter_inst|count[0]~2_combout\ = \fsm_inst|counter_inst|count\(0) $ (\fsm_inst|state.wave_out~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \fsm_inst|counter_inst|count\(0),
	datad => \fsm_inst|state.wave_out~q\,
	combout => \fsm_inst|counter_inst|count[0]~2_combout\);

-- Location: IOIBUF_X0_Y11_N15
\res~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_res,
	o => \res~input_o\);

-- Location: LCCOMB_X6_Y20_N12
\fsm_inst|counter_inst|res_count\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|counter_inst|res_count~combout\ = (\res~input_o\) # (!\fsm_inst|state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \res~input_o\,
	datad => \fsm_inst|state.idle~q\,
	combout => \fsm_inst|counter_inst|res_count~combout\);

-- Location: FF_X6_Y20_N9
\fsm_inst|counter_inst|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \fsm_inst|counter_inst|count[0]~2_combout\,
	clrn => \fsm_inst|counter_inst|ALT_INV_res_count~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsm_inst|counter_inst|count\(0));

-- Location: LCCOMB_X6_Y20_N18
\fsm_inst|counter_inst|count[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|counter_inst|count[1]~1_combout\ = \fsm_inst|counter_inst|count\(1) $ (((\fsm_inst|counter_inst|count\(0) & \fsm_inst|state.wave_out~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \fsm_inst|counter_inst|count\(0),
	datac => \fsm_inst|counter_inst|count\(1),
	datad => \fsm_inst|state.wave_out~q\,
	combout => \fsm_inst|counter_inst|count[1]~1_combout\);

-- Location: FF_X6_Y20_N19
\fsm_inst|counter_inst|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \fsm_inst|counter_inst|count[1]~1_combout\,
	clrn => \fsm_inst|counter_inst|ALT_INV_res_count~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsm_inst|counter_inst|count\(1));

-- Location: LCCOMB_X6_Y20_N28
\fsm_inst|counter_inst|count[2]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|counter_inst|count[2]~0_combout\ = \fsm_inst|counter_inst|count\(2) $ (((\fsm_inst|state.wave_out~q\ & (\fsm_inst|counter_inst|count\(0) & \fsm_inst|counter_inst|count\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm_inst|state.wave_out~q\,
	datab => \fsm_inst|counter_inst|count\(0),
	datac => \fsm_inst|counter_inst|count\(2),
	datad => \fsm_inst|counter_inst|count\(1),
	combout => \fsm_inst|counter_inst|count[2]~0_combout\);

-- Location: FF_X6_Y20_N29
\fsm_inst|counter_inst|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \fsm_inst|counter_inst|count[2]~0_combout\,
	clrn => \fsm_inst|counter_inst|ALT_INV_res_count~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsm_inst|counter_inst|count\(2));

-- Location: LCCOMB_X6_Y20_N14
\fsm_inst|Selector1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|Selector1~0_combout\ = (\fsm_inst|state.wave_out~q\ & (((!\fsm_inst|counter_inst|count\(1)) # (!\fsm_inst|counter_inst|count\(0))) # (!\fsm_inst|counter_inst|count\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm_inst|state.wave_out~q\,
	datab => \fsm_inst|counter_inst|count\(2),
	datac => \fsm_inst|counter_inst|count\(0),
	datad => \fsm_inst|counter_inst|count\(1),
	combout => \fsm_inst|Selector1~0_combout\);

-- Location: LCCOMB_X7_Y20_N2
\fsm_inst|Selector1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|Selector1~1_combout\ = (\fsm_inst|state.wave_gen~q\) # (\fsm_inst|Selector1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm_inst|state.wave_gen~q\,
	datad => \fsm_inst|Selector1~0_combout\,
	combout => \fsm_inst|Selector1~1_combout\);

-- Location: CLKCTRL_G4
\res~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \res~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \res~inputclkctrl_outclk\);

-- Location: FF_X7_Y20_N3
\fsm_inst|state.wave_out\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \fsm_inst|Selector1~1_combout\,
	clrn => \ALT_INV_res~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsm_inst|state.wave_out~q\);

-- Location: LCCOMB_X6_Y20_N30
\fsm_inst|Selector0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|Selector0~0_combout\ = (\fsm_inst|state.wave_out~q\ & (\fsm_inst|counter_inst|count\(1) & (\fsm_inst|counter_inst|count\(0) & \fsm_inst|counter_inst|count\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm_inst|state.wave_out~q\,
	datab => \fsm_inst|counter_inst|count\(1),
	datac => \fsm_inst|counter_inst|count\(0),
	datad => \fsm_inst|counter_inst|count\(2),
	combout => \fsm_inst|Selector0~0_combout\);

-- Location: IOIBUF_X7_Y24_N8
\x[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x(7),
	o => \x[7]~input_o\);

-- Location: LCCOMB_X5_Y20_N16
\fsm_inst|event_on_x_inst|x_reg[7]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|event_on_x_inst|x_reg[7]~29_combout\ = (GLOBAL(\res~inputclkctrl_outclk\) & (\x[7]~input_o\)) # (!GLOBAL(\res~inputclkctrl_outclk\) & ((\fsm_inst|event_on_x_inst|x_reg[7]~29_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x[7]~input_o\,
	datac => \res~inputclkctrl_outclk\,
	datad => \fsm_inst|event_on_x_inst|x_reg[7]~29_combout\,
	combout => \fsm_inst|event_on_x_inst|x_reg[7]~29_combout\);

-- Location: LCCOMB_X5_Y20_N30
\fsm_inst|event_on_x_inst|x_reg[7]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|event_on_x_inst|x_reg[7]~31_combout\ = \fsm_inst|event_on_x_inst|x_reg[7]~29_combout\ $ (\x[7]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \fsm_inst|event_on_x_inst|x_reg[7]~29_combout\,
	datad => \x[7]~input_o\,
	combout => \fsm_inst|event_on_x_inst|x_reg[7]~31_combout\);

-- Location: FF_X5_Y20_N31
\fsm_inst|event_on_x_inst|x_reg[7]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \fsm_inst|event_on_x_inst|x_reg[7]~31_combout\,
	clrn => \ALT_INV_res~inputclkctrl_outclk\,
	ena => \fsm_inst|ALT_INV_state.idle~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsm_inst|event_on_x_inst|x_reg[7]~_emulated_q\);

-- Location: LCCOMB_X5_Y20_N0
\fsm_inst|event_on_x_inst|x_reg[7]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|event_on_x_inst|x_reg[7]~30_combout\ = (\res~input_o\ & (\x[7]~input_o\)) # (!\res~input_o\ & ((\fsm_inst|event_on_x_inst|x_reg[7]~_emulated_q\ $ (\fsm_inst|event_on_x_inst|x_reg[7]~29_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101110111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x[7]~input_o\,
	datab => \res~input_o\,
	datac => \fsm_inst|event_on_x_inst|x_reg[7]~_emulated_q\,
	datad => \fsm_inst|event_on_x_inst|x_reg[7]~29_combout\,
	combout => \fsm_inst|event_on_x_inst|x_reg[7]~30_combout\);

-- Location: IOIBUF_X9_Y24_N8
\x[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x(6),
	o => \x[6]~input_o\);

-- Location: LCCOMB_X5_Y20_N10
\fsm_inst|event_on_x_inst|x_reg[6]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|event_on_x_inst|x_reg[6]~25_combout\ = (GLOBAL(\res~inputclkctrl_outclk\) & (\x[6]~input_o\)) # (!GLOBAL(\res~inputclkctrl_outclk\) & ((\fsm_inst|event_on_x_inst|x_reg[6]~25_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x[6]~input_o\,
	datac => \res~inputclkctrl_outclk\,
	datad => \fsm_inst|event_on_x_inst|x_reg[6]~25_combout\,
	combout => \fsm_inst|event_on_x_inst|x_reg[6]~25_combout\);

-- Location: LCCOMB_X5_Y20_N22
\fsm_inst|event_on_x_inst|x_reg[6]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|event_on_x_inst|x_reg[6]~27_combout\ = \x[6]~input_o\ $ (\fsm_inst|event_on_x_inst|x_reg[6]~25_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \x[6]~input_o\,
	datad => \fsm_inst|event_on_x_inst|x_reg[6]~25_combout\,
	combout => \fsm_inst|event_on_x_inst|x_reg[6]~27_combout\);

-- Location: FF_X5_Y20_N23
\fsm_inst|event_on_x_inst|x_reg[6]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \fsm_inst|event_on_x_inst|x_reg[6]~27_combout\,
	clrn => \ALT_INV_res~inputclkctrl_outclk\,
	ena => \fsm_inst|ALT_INV_state.idle~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsm_inst|event_on_x_inst|x_reg[6]~_emulated_q\);

-- Location: LCCOMB_X5_Y20_N4
\fsm_inst|event_on_x_inst|x_reg[6]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|event_on_x_inst|x_reg[6]~26_combout\ = (\res~input_o\ & (\x[6]~input_o\)) # (!\res~input_o\ & ((\fsm_inst|event_on_x_inst|x_reg[6]~_emulated_q\ $ (\fsm_inst|event_on_x_inst|x_reg[6]~25_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101110111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x[6]~input_o\,
	datab => \res~input_o\,
	datac => \fsm_inst|event_on_x_inst|x_reg[6]~_emulated_q\,
	datad => \fsm_inst|event_on_x_inst|x_reg[6]~25_combout\,
	combout => \fsm_inst|event_on_x_inst|x_reg[6]~26_combout\);

-- Location: LCCOMB_X5_Y20_N26
\fsm_inst|event_on_x_inst|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|event_on_x_inst|Equal0~3_combout\ = (\x[7]~input_o\ & (\fsm_inst|event_on_x_inst|x_reg[7]~30_combout\ & (\x[6]~input_o\ $ (!\fsm_inst|event_on_x_inst|x_reg[6]~26_combout\)))) # (!\x[7]~input_o\ & (!\fsm_inst|event_on_x_inst|x_reg[7]~30_combout\ 
-- & (\x[6]~input_o\ $ (!\fsm_inst|event_on_x_inst|x_reg[6]~26_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x[7]~input_o\,
	datab => \fsm_inst|event_on_x_inst|x_reg[7]~30_combout\,
	datac => \x[6]~input_o\,
	datad => \fsm_inst|event_on_x_inst|x_reg[6]~26_combout\,
	combout => \fsm_inst|event_on_x_inst|Equal0~3_combout\);

-- Location: IOIBUF_X5_Y24_N8
\x[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x(1),
	o => \x[1]~input_o\);

-- Location: LCCOMB_X5_Y20_N2
\fsm_inst|event_on_x_inst|x_reg[1]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|event_on_x_inst|x_reg[1]~5_combout\ = (GLOBAL(\res~inputclkctrl_outclk\) & (\x[1]~input_o\)) # (!GLOBAL(\res~inputclkctrl_outclk\) & ((\fsm_inst|event_on_x_inst|x_reg[1]~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x[1]~input_o\,
	datab => \fsm_inst|event_on_x_inst|x_reg[1]~5_combout\,
	datad => \res~inputclkctrl_outclk\,
	combout => \fsm_inst|event_on_x_inst|x_reg[1]~5_combout\);

-- Location: LCCOMB_X6_Y20_N0
\fsm_inst|event_on_x_inst|x_reg[1]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|event_on_x_inst|x_reg[1]~7_combout\ = \x[1]~input_o\ $ (\fsm_inst|event_on_x_inst|x_reg[1]~5_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \x[1]~input_o\,
	datad => \fsm_inst|event_on_x_inst|x_reg[1]~5_combout\,
	combout => \fsm_inst|event_on_x_inst|x_reg[1]~7_combout\);

-- Location: FF_X5_Y20_N3
\fsm_inst|event_on_x_inst|x_reg[1]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \fsm_inst|event_on_x_inst|x_reg[1]~7_combout\,
	clrn => \ALT_INV_res~inputclkctrl_outclk\,
	sload => VCC,
	ena => \fsm_inst|ALT_INV_state.idle~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsm_inst|event_on_x_inst|x_reg[1]~_emulated_q\);

-- Location: LCCOMB_X5_Y20_N12
\fsm_inst|event_on_x_inst|x_reg[1]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|event_on_x_inst|x_reg[1]~6_combout\ = (\res~input_o\ & (\x[1]~input_o\)) # (!\res~input_o\ & ((\fsm_inst|event_on_x_inst|x_reg[1]~_emulated_q\ $ (\fsm_inst|event_on_x_inst|x_reg[1]~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101110111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x[1]~input_o\,
	datab => \res~input_o\,
	datac => \fsm_inst|event_on_x_inst|x_reg[1]~_emulated_q\,
	datad => \fsm_inst|event_on_x_inst|x_reg[1]~5_combout\,
	combout => \fsm_inst|event_on_x_inst|x_reg[1]~6_combout\);

-- Location: IOIBUF_X7_Y24_N1
\x[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x(0),
	o => \x[0]~input_o\);

-- Location: LCCOMB_X5_Y20_N6
\fsm_inst|event_on_x_inst|x_reg[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|event_on_x_inst|x_reg[0]~1_combout\ = (GLOBAL(\res~inputclkctrl_outclk\) & (\x[0]~input_o\)) # (!GLOBAL(\res~inputclkctrl_outclk\) & ((\fsm_inst|event_on_x_inst|x_reg[0]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \x[0]~input_o\,
	datac => \res~inputclkctrl_outclk\,
	datad => \fsm_inst|event_on_x_inst|x_reg[0]~1_combout\,
	combout => \fsm_inst|event_on_x_inst|x_reg[0]~1_combout\);

-- Location: LCCOMB_X5_Y20_N18
\fsm_inst|event_on_x_inst|x_reg[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|event_on_x_inst|x_reg[0]~3_combout\ = \x[0]~input_o\ $ (\fsm_inst|event_on_x_inst|x_reg[0]~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \x[0]~input_o\,
	datad => \fsm_inst|event_on_x_inst|x_reg[0]~1_combout\,
	combout => \fsm_inst|event_on_x_inst|x_reg[0]~3_combout\);

-- Location: FF_X5_Y20_N19
\fsm_inst|event_on_x_inst|x_reg[0]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \fsm_inst|event_on_x_inst|x_reg[0]~3_combout\,
	clrn => \ALT_INV_res~inputclkctrl_outclk\,
	ena => \fsm_inst|ALT_INV_state.idle~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsm_inst|event_on_x_inst|x_reg[0]~_emulated_q\);

-- Location: LCCOMB_X5_Y20_N28
\fsm_inst|event_on_x_inst|x_reg[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|event_on_x_inst|x_reg[0]~2_combout\ = (\res~input_o\ & (\x[0]~input_o\)) # (!\res~input_o\ & ((\fsm_inst|event_on_x_inst|x_reg[0]~_emulated_q\ $ (\fsm_inst|event_on_x_inst|x_reg[0]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001110101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x[0]~input_o\,
	datab => \fsm_inst|event_on_x_inst|x_reg[0]~_emulated_q\,
	datac => \res~input_o\,
	datad => \fsm_inst|event_on_x_inst|x_reg[0]~1_combout\,
	combout => \fsm_inst|event_on_x_inst|x_reg[0]~2_combout\);

-- Location: LCCOMB_X5_Y20_N20
\fsm_inst|event_on_x_inst|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|event_on_x_inst|Equal0~0_combout\ = (\fsm_inst|event_on_x_inst|x_reg[1]~6_combout\ & (\x[1]~input_o\ & (\fsm_inst|event_on_x_inst|x_reg[0]~2_combout\ $ (!\x[0]~input_o\)))) # (!\fsm_inst|event_on_x_inst|x_reg[1]~6_combout\ & (!\x[1]~input_o\ & 
-- (\fsm_inst|event_on_x_inst|x_reg[0]~2_combout\ $ (!\x[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm_inst|event_on_x_inst|x_reg[1]~6_combout\,
	datab => \fsm_inst|event_on_x_inst|x_reg[0]~2_combout\,
	datac => \x[1]~input_o\,
	datad => \x[0]~input_o\,
	combout => \fsm_inst|event_on_x_inst|Equal0~0_combout\);

-- Location: IOIBUF_X34_Y12_N8
\x[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x(4),
	o => \x[4]~input_o\);

-- Location: IOIBUF_X34_Y12_N1
\x[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x(5),
	o => \x[5]~input_o\);

-- Location: LCCOMB_X4_Y20_N14
\fsm_inst|event_on_x_inst|x_reg[5]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|event_on_x_inst|x_reg[5]~21_combout\ = (GLOBAL(\res~inputclkctrl_outclk\) & (\x[5]~input_o\)) # (!GLOBAL(\res~inputclkctrl_outclk\) & ((\fsm_inst|event_on_x_inst|x_reg[5]~21_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \x[5]~input_o\,
	datac => \fsm_inst|event_on_x_inst|x_reg[5]~21_combout\,
	datad => \res~inputclkctrl_outclk\,
	combout => \fsm_inst|event_on_x_inst|x_reg[5]~21_combout\);

-- Location: LCCOMB_X4_Y20_N6
\fsm_inst|event_on_x_inst|x_reg[5]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|event_on_x_inst|x_reg[5]~23_combout\ = \fsm_inst|event_on_x_inst|x_reg[5]~21_combout\ $ (\x[5]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm_inst|event_on_x_inst|x_reg[5]~21_combout\,
	datad => \x[5]~input_o\,
	combout => \fsm_inst|event_on_x_inst|x_reg[5]~23_combout\);

-- Location: FF_X4_Y20_N7
\fsm_inst|event_on_x_inst|x_reg[5]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \fsm_inst|event_on_x_inst|x_reg[5]~23_combout\,
	clrn => \ALT_INV_res~inputclkctrl_outclk\,
	ena => \fsm_inst|ALT_INV_state.idle~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsm_inst|event_on_x_inst|x_reg[5]~_emulated_q\);

-- Location: LCCOMB_X4_Y20_N4
\fsm_inst|event_on_x_inst|x_reg[5]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|event_on_x_inst|x_reg[5]~22_combout\ = (\res~input_o\ & (\x[5]~input_o\)) # (!\res~input_o\ & ((\fsm_inst|event_on_x_inst|x_reg[5]~21_combout\ $ (\fsm_inst|event_on_x_inst|x_reg[5]~_emulated_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110111011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \res~input_o\,
	datab => \x[5]~input_o\,
	datac => \fsm_inst|event_on_x_inst|x_reg[5]~21_combout\,
	datad => \fsm_inst|event_on_x_inst|x_reg[5]~_emulated_q\,
	combout => \fsm_inst|event_on_x_inst|x_reg[5]~22_combout\);

-- Location: LCCOMB_X4_Y20_N20
\fsm_inst|event_on_x_inst|x_reg[4]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|event_on_x_inst|x_reg[4]~17_combout\ = (GLOBAL(\res~inputclkctrl_outclk\) & (\x[4]~input_o\)) # (!GLOBAL(\res~inputclkctrl_outclk\) & ((\fsm_inst|event_on_x_inst|x_reg[4]~17_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x[4]~input_o\,
	datab => \fsm_inst|event_on_x_inst|x_reg[4]~17_combout\,
	datad => \res~inputclkctrl_outclk\,
	combout => \fsm_inst|event_on_x_inst|x_reg[4]~17_combout\);

-- Location: LCCOMB_X4_Y20_N30
\fsm_inst|event_on_x_inst|x_reg[4]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|event_on_x_inst|x_reg[4]~19_combout\ = \fsm_inst|event_on_x_inst|x_reg[4]~17_combout\ $ (\x[4]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \fsm_inst|event_on_x_inst|x_reg[4]~17_combout\,
	datad => \x[4]~input_o\,
	combout => \fsm_inst|event_on_x_inst|x_reg[4]~19_combout\);

-- Location: FF_X4_Y20_N31
\fsm_inst|event_on_x_inst|x_reg[4]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \fsm_inst|event_on_x_inst|x_reg[4]~19_combout\,
	clrn => \ALT_INV_res~inputclkctrl_outclk\,
	ena => \fsm_inst|ALT_INV_state.idle~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsm_inst|event_on_x_inst|x_reg[4]~_emulated_q\);

-- Location: LCCOMB_X4_Y20_N8
\fsm_inst|event_on_x_inst|x_reg[4]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|event_on_x_inst|x_reg[4]~18_combout\ = (\res~input_o\ & (\x[4]~input_o\)) # (!\res~input_o\ & ((\fsm_inst|event_on_x_inst|x_reg[4]~_emulated_q\ $ (\fsm_inst|event_on_x_inst|x_reg[4]~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110111011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \res~input_o\,
	datab => \x[4]~input_o\,
	datac => \fsm_inst|event_on_x_inst|x_reg[4]~_emulated_q\,
	datad => \fsm_inst|event_on_x_inst|x_reg[4]~17_combout\,
	combout => \fsm_inst|event_on_x_inst|x_reg[4]~18_combout\);

-- Location: LCCOMB_X4_Y20_N16
\fsm_inst|event_on_x_inst|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|event_on_x_inst|Equal0~2_combout\ = (\x[4]~input_o\ & (\fsm_inst|event_on_x_inst|x_reg[4]~18_combout\ & (\x[5]~input_o\ $ (!\fsm_inst|event_on_x_inst|x_reg[5]~22_combout\)))) # (!\x[4]~input_o\ & (!\fsm_inst|event_on_x_inst|x_reg[4]~18_combout\ 
-- & (\x[5]~input_o\ $ (!\fsm_inst|event_on_x_inst|x_reg[5]~22_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x[4]~input_o\,
	datab => \x[5]~input_o\,
	datac => \fsm_inst|event_on_x_inst|x_reg[5]~22_combout\,
	datad => \fsm_inst|event_on_x_inst|x_reg[4]~18_combout\,
	combout => \fsm_inst|event_on_x_inst|Equal0~2_combout\);

-- Location: IOIBUF_X1_Y24_N1
\x[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x(3),
	o => \x[3]~input_o\);

-- Location: LCCOMB_X4_Y20_N22
\fsm_inst|event_on_x_inst|x_reg[3]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|event_on_x_inst|x_reg[3]~13_combout\ = (GLOBAL(\res~inputclkctrl_outclk\) & (\x[3]~input_o\)) # (!GLOBAL(\res~inputclkctrl_outclk\) & ((\fsm_inst|event_on_x_inst|x_reg[3]~13_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x[3]~input_o\,
	datac => \fsm_inst|event_on_x_inst|x_reg[3]~13_combout\,
	datad => \res~inputclkctrl_outclk\,
	combout => \fsm_inst|event_on_x_inst|x_reg[3]~13_combout\);

-- Location: LCCOMB_X4_Y20_N10
\fsm_inst|event_on_x_inst|x_reg[3]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|event_on_x_inst|x_reg[3]~15_combout\ = \x[3]~input_o\ $ (\fsm_inst|event_on_x_inst|x_reg[3]~13_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \x[3]~input_o\,
	datad => \fsm_inst|event_on_x_inst|x_reg[3]~13_combout\,
	combout => \fsm_inst|event_on_x_inst|x_reg[3]~15_combout\);

-- Location: FF_X4_Y20_N11
\fsm_inst|event_on_x_inst|x_reg[3]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \fsm_inst|event_on_x_inst|x_reg[3]~15_combout\,
	clrn => \ALT_INV_res~inputclkctrl_outclk\,
	ena => \fsm_inst|ALT_INV_state.idle~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsm_inst|event_on_x_inst|x_reg[3]~_emulated_q\);

-- Location: LCCOMB_X4_Y20_N0
\fsm_inst|event_on_x_inst|x_reg[3]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|event_on_x_inst|x_reg[3]~14_combout\ = (\res~input_o\ & (\x[3]~input_o\)) # (!\res~input_o\ & ((\fsm_inst|event_on_x_inst|x_reg[3]~13_combout\ $ (\fsm_inst|event_on_x_inst|x_reg[3]~_emulated_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110111011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \res~input_o\,
	datab => \x[3]~input_o\,
	datac => \fsm_inst|event_on_x_inst|x_reg[3]~13_combout\,
	datad => \fsm_inst|event_on_x_inst|x_reg[3]~_emulated_q\,
	combout => \fsm_inst|event_on_x_inst|x_reg[3]~14_combout\);

-- Location: IOIBUF_X3_Y24_N22
\x[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x(2),
	o => \x[2]~input_o\);

-- Location: LCCOMB_X4_Y20_N24
\fsm_inst|event_on_x_inst|x_reg[2]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|event_on_x_inst|x_reg[2]~9_combout\ = (GLOBAL(\res~inputclkctrl_outclk\) & (\x[2]~input_o\)) # (!GLOBAL(\res~inputclkctrl_outclk\) & ((\fsm_inst|event_on_x_inst|x_reg[2]~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \x[2]~input_o\,
	datac => \fsm_inst|event_on_x_inst|x_reg[2]~9_combout\,
	datad => \res~inputclkctrl_outclk\,
	combout => \fsm_inst|event_on_x_inst|x_reg[2]~9_combout\);

-- Location: LCCOMB_X4_Y20_N18
\fsm_inst|event_on_x_inst|x_reg[2]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|event_on_x_inst|x_reg[2]~11_combout\ = \fsm_inst|event_on_x_inst|x_reg[2]~9_combout\ $ (\x[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm_inst|event_on_x_inst|x_reg[2]~9_combout\,
	datac => \x[2]~input_o\,
	combout => \fsm_inst|event_on_x_inst|x_reg[2]~11_combout\);

-- Location: FF_X4_Y20_N19
\fsm_inst|event_on_x_inst|x_reg[2]~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \fsm_inst|event_on_x_inst|x_reg[2]~11_combout\,
	clrn => \ALT_INV_res~inputclkctrl_outclk\,
	ena => \fsm_inst|ALT_INV_state.idle~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsm_inst|event_on_x_inst|x_reg[2]~_emulated_q\);

-- Location: LCCOMB_X4_Y20_N28
\fsm_inst|event_on_x_inst|x_reg[2]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|event_on_x_inst|x_reg[2]~10_combout\ = (\res~input_o\ & (((\x[2]~input_o\)))) # (!\res~input_o\ & (\fsm_inst|event_on_x_inst|x_reg[2]~9_combout\ $ (((\fsm_inst|event_on_x_inst|x_reg[2]~_emulated_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000111100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \res~input_o\,
	datab => \fsm_inst|event_on_x_inst|x_reg[2]~9_combout\,
	datac => \x[2]~input_o\,
	datad => \fsm_inst|event_on_x_inst|x_reg[2]~_emulated_q\,
	combout => \fsm_inst|event_on_x_inst|x_reg[2]~10_combout\);

-- Location: LCCOMB_X4_Y20_N26
\fsm_inst|event_on_x_inst|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|event_on_x_inst|Equal0~1_combout\ = (\x[3]~input_o\ & (\fsm_inst|event_on_x_inst|x_reg[3]~14_combout\ & (\x[2]~input_o\ $ (!\fsm_inst|event_on_x_inst|x_reg[2]~10_combout\)))) # (!\x[3]~input_o\ & (!\fsm_inst|event_on_x_inst|x_reg[3]~14_combout\ 
-- & (\x[2]~input_o\ $ (!\fsm_inst|event_on_x_inst|x_reg[2]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x[3]~input_o\,
	datab => \fsm_inst|event_on_x_inst|x_reg[3]~14_combout\,
	datac => \x[2]~input_o\,
	datad => \fsm_inst|event_on_x_inst|x_reg[2]~10_combout\,
	combout => \fsm_inst|event_on_x_inst|Equal0~1_combout\);

-- Location: LCCOMB_X5_Y20_N8
\fsm_inst|event_on_x_inst|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|event_on_x_inst|Equal0~4_combout\ = (\fsm_inst|event_on_x_inst|Equal0~3_combout\ & (\fsm_inst|event_on_x_inst|Equal0~0_combout\ & (\fsm_inst|event_on_x_inst|Equal0~2_combout\ & \fsm_inst|event_on_x_inst|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm_inst|event_on_x_inst|Equal0~3_combout\,
	datab => \fsm_inst|event_on_x_inst|Equal0~0_combout\,
	datac => \fsm_inst|event_on_x_inst|Equal0~2_combout\,
	datad => \fsm_inst|event_on_x_inst|Equal0~1_combout\,
	combout => \fsm_inst|event_on_x_inst|Equal0~4_combout\);

-- Location: LCCOMB_X5_Y20_N14
\fsm_inst|Selector0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|Selector0~1_combout\ = (!\fsm_inst|Selector0~0_combout\ & ((\fsm_inst|state.idle~q\) # (!\fsm_inst|event_on_x_inst|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm_inst|Selector0~0_combout\,
	datac => \fsm_inst|state.idle~q\,
	datad => \fsm_inst|event_on_x_inst|Equal0~4_combout\,
	combout => \fsm_inst|Selector0~1_combout\);

-- Location: FF_X5_Y20_N15
\fsm_inst|state.idle\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \fsm_inst|Selector0~1_combout\,
	clrn => \ALT_INV_res~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsm_inst|state.idle~q\);

-- Location: LCCOMB_X5_Y20_N24
\fsm_inst|nstate.find_ij~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|nstate.find_ij~0_combout\ = (!\fsm_inst|state.idle~q\ & !\fsm_inst|event_on_x_inst|Equal0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \fsm_inst|state.idle~q\,
	datac => \fsm_inst|event_on_x_inst|Equal0~4_combout\,
	combout => \fsm_inst|nstate.find_ij~0_combout\);

-- Location: FF_X5_Y20_N25
\fsm_inst|state.find_ij\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \fsm_inst|nstate.find_ij~0_combout\,
	clrn => \ALT_INV_res~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsm_inst|state.find_ij~q\);

-- Location: LCCOMB_X8_Y20_N6
\fsm_inst|state.wave_gen~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm_inst|state.wave_gen~feeder_combout\ = \fsm_inst|state.find_ij~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \fsm_inst|state.find_ij~q\,
	combout => \fsm_inst|state.wave_gen~feeder_combout\);

-- Location: FF_X8_Y20_N7
\fsm_inst|state.wave_gen\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \fsm_inst|state.wave_gen~feeder_combout\,
	clrn => \ALT_INV_res~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsm_inst|state.wave_gen~q\);

-- Location: LCCOMB_X7_Y20_N12
\finder_inst|rc_ij:first_var[2]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \finder_inst|rc_ij:first_var[2]~0_combout\ = (\x[7]~input_o\) # ((\x[5]~input_o\) # ((\x[6]~input_o\) # (\x[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x[7]~input_o\,
	datab => \x[5]~input_o\,
	datac => \x[6]~input_o\,
	datad => \x[4]~input_o\,
	combout => \finder_inst|rc_ij:first_var[2]~0_combout\);

-- Location: LCCOMB_X4_Y20_N12
\finder_inst|rc_ij:first_var[2]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \finder_inst|rc_ij:first_var[2]~1_combout\ = (!\x[2]~input_o\ & !\x[3]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \x[2]~input_o\,
	datac => \x[3]~input_o\,
	combout => \finder_inst|rc_ij:first_var[2]~1_combout\);

-- Location: LCCOMB_X7_Y20_N4
\finder_inst|rc_ij:first_var[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \finder_inst|rc_ij:first_var[2]~2_combout\ = (\finder_inst|rc_ij:first_var[2]~0_combout\ & (!\x[1]~input_o\ & (!\x[0]~input_o\ & \finder_inst|rc_ij:first_var[2]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \finder_inst|rc_ij:first_var[2]~0_combout\,
	datab => \x[1]~input_o\,
	datac => \x[0]~input_o\,
	datad => \finder_inst|rc_ij:first_var[2]~1_combout\,
	combout => \finder_inst|rc_ij:first_var[2]~2_combout\);

-- Location: FF_X7_Y20_N5
\finder_inst|first_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \finder_inst|rc_ij:first_var[2]~2_combout\,
	clrn => \ALT_INV_res~inputclkctrl_outclk\,
	ena => \fsm_inst|state.find_ij~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \finder_inst|first_reg\(2));

-- Location: FF_X7_Y20_N13
\finder_inst|last_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \finder_inst|rc_ij:first_var[2]~0_combout\,
	clrn => \ALT_INV_res~inputclkctrl_outclk\,
	ena => \fsm_inst|state.find_ij~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \finder_inst|last_reg\(2));

-- Location: LCCOMB_X7_Y20_N10
\finder_inst|rc_ij:last_var[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \finder_inst|rc_ij:last_var[1]~0_combout\ = (!\x[4]~input_o\ & (!\x[5]~input_o\ & ((\x[2]~input_o\) # (\x[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x[4]~input_o\,
	datab => \x[2]~input_o\,
	datac => \x[3]~input_o\,
	datad => \x[5]~input_o\,
	combout => \finder_inst|rc_ij:last_var[1]~0_combout\);

-- Location: LCCOMB_X7_Y20_N6
\finder_inst|rc_ij:last_var[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \finder_inst|rc_ij:last_var[1]~1_combout\ = (\x[7]~input_o\) # ((\x[6]~input_o\) # (\finder_inst|rc_ij:last_var[1]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x[7]~input_o\,
	datac => \x[6]~input_o\,
	datad => \finder_inst|rc_ij:last_var[1]~0_combout\,
	combout => \finder_inst|rc_ij:last_var[1]~1_combout\);

-- Location: FF_X7_Y20_N7
\finder_inst|last_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \finder_inst|rc_ij:last_var[1]~1_combout\,
	clrn => \ALT_INV_res~inputclkctrl_outclk\,
	ena => \fsm_inst|state.find_ij~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \finder_inst|last_reg\(1));

-- Location: LCCOMB_X7_Y20_N26
\finder_inst|rc_ij:first_var[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \finder_inst|rc_ij:first_var[0]~1_combout\ = (!\x[2]~input_o\ & ((\x[5]~input_o\) # ((\x[7]~input_o\ & !\x[6]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x[7]~input_o\,
	datab => \x[2]~input_o\,
	datac => \x[6]~input_o\,
	datad => \x[5]~input_o\,
	combout => \finder_inst|rc_ij:first_var[0]~1_combout\);

-- Location: LCCOMB_X7_Y20_N16
\finder_inst|rc_ij:first_var[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \finder_inst|rc_ij:first_var[0]~0_combout\ = (\x[1]~input_o\) # ((!\x[2]~input_o\ & \x[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \x[2]~input_o\,
	datac => \x[3]~input_o\,
	datad => \x[1]~input_o\,
	combout => \finder_inst|rc_ij:first_var[0]~0_combout\);

-- Location: LCCOMB_X7_Y20_N20
\finder_inst|rc_ij:first_var[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \finder_inst|rc_ij:first_var[0]~2_combout\ = (!\x[0]~input_o\ & ((\finder_inst|rc_ij:first_var[0]~0_combout\) # ((\finder_inst|rc_ij:first_var[0]~1_combout\ & !\x[4]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \finder_inst|rc_ij:first_var[0]~1_combout\,
	datab => \finder_inst|rc_ij:first_var[0]~0_combout\,
	datac => \x[0]~input_o\,
	datad => \x[4]~input_o\,
	combout => \finder_inst|rc_ij:first_var[0]~2_combout\);

-- Location: FF_X7_Y20_N21
\finder_inst|first_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \finder_inst|rc_ij:first_var[0]~2_combout\,
	clrn => \ALT_INV_res~inputclkctrl_outclk\,
	ena => \fsm_inst|state.find_ij~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \finder_inst|first_reg\(0));

-- Location: LCCOMB_X7_Y20_N22
\finder_inst|rc_ij:first_var[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \finder_inst|rc_ij:first_var[1]~0_combout\ = (!\x[5]~input_o\ & (!\x[4]~input_o\ & ((\x[7]~input_o\) # (\x[6]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x[7]~input_o\,
	datab => \x[5]~input_o\,
	datac => \x[6]~input_o\,
	datad => \x[4]~input_o\,
	combout => \finder_inst|rc_ij:first_var[1]~0_combout\);

-- Location: LCCOMB_X7_Y20_N18
\finder_inst|rc_ij:first_var[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \finder_inst|rc_ij:first_var[1]~1_combout\ = (!\x[1]~input_o\ & (!\x[0]~input_o\ & ((\finder_inst|rc_ij:first_var[1]~0_combout\) # (!\finder_inst|rc_ij:first_var[2]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \finder_inst|rc_ij:first_var[1]~0_combout\,
	datab => \x[1]~input_o\,
	datac => \x[0]~input_o\,
	datad => \finder_inst|rc_ij:first_var[2]~1_combout\,
	combout => \finder_inst|rc_ij:first_var[1]~1_combout\);

-- Location: FF_X7_Y20_N19
\finder_inst|first_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \finder_inst|rc_ij:first_var[1]~1_combout\,
	clrn => \ALT_INV_res~inputclkctrl_outclk\,
	ena => \fsm_inst|state.find_ij~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \finder_inst|first_reg\(1));

-- Location: LCCOMB_X7_Y20_N30
\wave_out_inst|q_regs~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \wave_out_inst|q_regs~13_combout\ = (\finder_inst|last_reg\(1) & (((!\finder_inst|first_reg\(1)) # (!\finder_inst|first_reg\(2))) # (!\finder_inst|first_reg\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \finder_inst|last_reg\(1),
	datab => \finder_inst|first_reg\(0),
	datac => \finder_inst|first_reg\(2),
	datad => \finder_inst|first_reg\(1),
	combout => \wave_out_inst|q_regs~13_combout\);

-- Location: LCCOMB_X7_Y20_N8
\finder_inst|rc_ij:last_var[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \finder_inst|rc_ij:last_var[0]~0_combout\ = (!\x[4]~input_o\ & ((\x[3]~input_o\) # ((!\x[2]~input_o\ & \x[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x[4]~input_o\,
	datab => \x[2]~input_o\,
	datac => \x[3]~input_o\,
	datad => \x[1]~input_o\,
	combout => \finder_inst|rc_ij:last_var[0]~0_combout\);

-- Location: LCCOMB_X7_Y20_N28
\finder_inst|rc_ij:last_var[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \finder_inst|rc_ij:last_var[0]~1_combout\ = (\x[7]~input_o\) # ((!\x[6]~input_o\ & ((\finder_inst|rc_ij:last_var[0]~0_combout\) # (\x[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x[7]~input_o\,
	datab => \finder_inst|rc_ij:last_var[0]~0_combout\,
	datac => \x[6]~input_o\,
	datad => \x[5]~input_o\,
	combout => \finder_inst|rc_ij:last_var[0]~1_combout\);

-- Location: FF_X7_Y20_N29
\finder_inst|last_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \finder_inst|rc_ij:last_var[0]~1_combout\,
	clrn => \ALT_INV_res~inputclkctrl_outclk\,
	ena => \fsm_inst|state.find_ij~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \finder_inst|last_reg\(0));

-- Location: LCCOMB_X8_Y20_N2
\wave_out_inst|q_regs~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \wave_out_inst|q_regs~15_combout\ = (\fsm_inst|state.wave_gen~q\ & (\finder_inst|last_reg\(0) & (\finder_inst|last_reg\(1) & \finder_inst|last_reg\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm_inst|state.wave_gen~q\,
	datab => \finder_inst|last_reg\(0),
	datac => \finder_inst|last_reg\(1),
	datad => \finder_inst|last_reg\(2),
	combout => \wave_out_inst|q_regs~15_combout\);

-- Location: LCCOMB_X8_Y20_N4
\wave_out_inst|q_regs~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \wave_out_inst|q_regs~16_combout\ = (\wave_out_inst|q_regs~15_combout\) # ((!\fsm_inst|state.wave_gen~q\ & (\wave_out_inst|q_regs\(7) & !\fsm_inst|state.wave_out~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm_inst|state.wave_gen~q\,
	datab => \wave_out_inst|q_regs~15_combout\,
	datac => \wave_out_inst|q_regs\(7),
	datad => \fsm_inst|state.wave_out~q\,
	combout => \wave_out_inst|q_regs~16_combout\);

-- Location: FF_X8_Y20_N5
\wave_out_inst|q_regs[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \wave_out_inst|q_regs~16_combout\,
	clrn => \ALT_INV_res~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \wave_out_inst|q_regs\(7));

-- Location: LCCOMB_X8_Y20_N14
\wave_out_inst|q_regs~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \wave_out_inst|q_regs~14_combout\ = (\fsm_inst|state.wave_gen~q\ & (\wave_out_inst|q_regs~13_combout\ & ((\finder_inst|last_reg\(2))))) # (!\fsm_inst|state.wave_gen~q\ & (((\wave_out_inst|q_regs\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm_inst|state.wave_gen~q\,
	datab => \wave_out_inst|q_regs~13_combout\,
	datac => \wave_out_inst|q_regs\(7),
	datad => \finder_inst|last_reg\(2),
	combout => \wave_out_inst|q_regs~14_combout\);

-- Location: LCCOMB_X8_Y20_N8
\wave_out_inst|q_regs[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \wave_out_inst|q_regs[0]~2_combout\ = \fsm_inst|state.wave_gen~q\ $ (\fsm_inst|state.wave_out~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm_inst|state.wave_gen~q\,
	datad => \fsm_inst|state.wave_out~q\,
	combout => \wave_out_inst|q_regs[0]~2_combout\);

-- Location: FF_X8_Y20_N15
\wave_out_inst|q_regs[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \wave_out_inst|q_regs~14_combout\,
	clrn => \ALT_INV_res~inputclkctrl_outclk\,
	ena => \wave_out_inst|q_regs[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \wave_out_inst|q_regs\(6));

-- Location: LCCOMB_X7_Y20_N0
\wave_out_inst|q_regs~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \wave_out_inst|q_regs~11_combout\ = (\finder_inst|last_reg\(1) & (((!\finder_inst|first_reg\(2))) # (!\finder_inst|first_reg\(1)))) # (!\finder_inst|last_reg\(1) & (\finder_inst|last_reg\(0) & ((!\finder_inst|first_reg\(2)) # 
-- (!\finder_inst|first_reg\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \finder_inst|last_reg\(1),
	datab => \finder_inst|first_reg\(1),
	datac => \finder_inst|first_reg\(2),
	datad => \finder_inst|last_reg\(0),
	combout => \wave_out_inst|q_regs~11_combout\);

-- Location: LCCOMB_X8_Y20_N16
\wave_out_inst|q_regs~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \wave_out_inst|q_regs~12_combout\ = (\fsm_inst|state.wave_gen~q\ & (\finder_inst|last_reg\(2) & ((\wave_out_inst|q_regs~11_combout\)))) # (!\fsm_inst|state.wave_gen~q\ & (((\wave_out_inst|q_regs\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \finder_inst|last_reg\(2),
	datab => \wave_out_inst|q_regs\(6),
	datac => \wave_out_inst|q_regs~11_combout\,
	datad => \fsm_inst|state.wave_gen~q\,
	combout => \wave_out_inst|q_regs~12_combout\);

-- Location: FF_X8_Y20_N17
\wave_out_inst|q_regs[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \wave_out_inst|q_regs~12_combout\,
	clrn => \ALT_INV_res~inputclkctrl_outclk\,
	ena => \wave_out_inst|q_regs[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \wave_out_inst|q_regs\(5));

-- Location: LCCOMB_X8_Y20_N26
\wave_out_inst|q_regs~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \wave_out_inst|q_regs~9_combout\ = ((!\finder_inst|first_reg\(1) & !\finder_inst|first_reg\(0))) # (!\finder_inst|first_reg\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \finder_inst|first_reg\(1),
	datac => \finder_inst|first_reg\(2),
	datad => \finder_inst|first_reg\(0),
	combout => \wave_out_inst|q_regs~9_combout\);

-- Location: LCCOMB_X8_Y20_N30
\wave_out_inst|q_regs~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \wave_out_inst|q_regs~10_combout\ = (\fsm_inst|state.wave_gen~q\ & (\finder_inst|last_reg\(2) & ((\wave_out_inst|q_regs~9_combout\)))) # (!\fsm_inst|state.wave_gen~q\ & (((\wave_out_inst|q_regs\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \finder_inst|last_reg\(2),
	datab => \wave_out_inst|q_regs\(5),
	datac => \wave_out_inst|q_regs~9_combout\,
	datad => \fsm_inst|state.wave_gen~q\,
	combout => \wave_out_inst|q_regs~10_combout\);

-- Location: FF_X8_Y20_N31
\wave_out_inst|q_regs[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \wave_out_inst|q_regs~10_combout\,
	clrn => \ALT_INV_res~inputclkctrl_outclk\,
	ena => \wave_out_inst|q_regs[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \wave_out_inst|q_regs\(4));

-- Location: LCCOMB_X8_Y20_N12
\wave_out_inst|q_regs~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \wave_out_inst|q_regs~7_combout\ = (\finder_inst|last_reg\(2)) # ((\finder_inst|last_reg\(1) & \finder_inst|last_reg\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \finder_inst|last_reg\(2),
	datac => \finder_inst|last_reg\(1),
	datad => \finder_inst|last_reg\(0),
	combout => \wave_out_inst|q_regs~7_combout\);

-- Location: LCCOMB_X8_Y20_N28
\wave_out_inst|q_regs~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \wave_out_inst|q_regs~8_combout\ = (\fsm_inst|state.wave_gen~q\ & (!\finder_inst|first_reg\(2) & ((\wave_out_inst|q_regs~7_combout\)))) # (!\fsm_inst|state.wave_gen~q\ & (((\wave_out_inst|q_regs\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm_inst|state.wave_gen~q\,
	datab => \finder_inst|first_reg\(2),
	datac => \wave_out_inst|q_regs\(4),
	datad => \wave_out_inst|q_regs~7_combout\,
	combout => \wave_out_inst|q_regs~8_combout\);

-- Location: FF_X8_Y20_N29
\wave_out_inst|q_regs[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \wave_out_inst|q_regs~8_combout\,
	clrn => \ALT_INV_res~inputclkctrl_outclk\,
	ena => \wave_out_inst|q_regs[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \wave_out_inst|q_regs\(3));

-- Location: LCCOMB_X7_Y20_N14
\wave_out_inst|q_regs~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \wave_out_inst|q_regs~5_combout\ = (\finder_inst|last_reg\(1) & (((!\finder_inst|first_reg\(1))) # (!\finder_inst|first_reg\(0)))) # (!\finder_inst|last_reg\(1) & (\finder_inst|last_reg\(2) & ((!\finder_inst|first_reg\(1)) # 
-- (!\finder_inst|first_reg\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \finder_inst|last_reg\(1),
	datab => \finder_inst|first_reg\(0),
	datac => \finder_inst|last_reg\(2),
	datad => \finder_inst|first_reg\(1),
	combout => \wave_out_inst|q_regs~5_combout\);

-- Location: LCCOMB_X8_Y20_N18
\wave_out_inst|q_regs~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \wave_out_inst|q_regs~6_combout\ = (\fsm_inst|state.wave_gen~q\ & (((!\finder_inst|first_reg\(2) & \wave_out_inst|q_regs~5_combout\)))) # (!\fsm_inst|state.wave_gen~q\ & (\wave_out_inst|q_regs\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm_inst|state.wave_gen~q\,
	datab => \wave_out_inst|q_regs\(3),
	datac => \finder_inst|first_reg\(2),
	datad => \wave_out_inst|q_regs~5_combout\,
	combout => \wave_out_inst|q_regs~6_combout\);

-- Location: FF_X8_Y20_N19
\wave_out_inst|q_regs[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \wave_out_inst|q_regs~6_combout\,
	clrn => \ALT_INV_res~inputclkctrl_outclk\,
	ena => \wave_out_inst|q_regs[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \wave_out_inst|q_regs\(2));

-- Location: LCCOMB_X7_Y20_N24
\wave_out_inst|q_regs~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \wave_out_inst|q_regs~3_combout\ = (!\finder_inst|first_reg\(1) & ((\finder_inst|last_reg\(1)) # ((\finder_inst|last_reg\(2)) # (\finder_inst|last_reg\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \finder_inst|last_reg\(1),
	datab => \finder_inst|first_reg\(1),
	datac => \finder_inst|last_reg\(2),
	datad => \finder_inst|last_reg\(0),
	combout => \wave_out_inst|q_regs~3_combout\);

-- Location: LCCOMB_X8_Y20_N22
\wave_out_inst|q_regs~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \wave_out_inst|q_regs~4_combout\ = (\fsm_inst|state.wave_gen~q\ & (((!\finder_inst|first_reg\(2) & \wave_out_inst|q_regs~3_combout\)))) # (!\fsm_inst|state.wave_gen~q\ & (\wave_out_inst|q_regs\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm_inst|state.wave_gen~q\,
	datab => \wave_out_inst|q_regs\(2),
	datac => \finder_inst|first_reg\(2),
	datad => \wave_out_inst|q_regs~3_combout\,
	combout => \wave_out_inst|q_regs~4_combout\);

-- Location: FF_X8_Y20_N23
\wave_out_inst|q_regs[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \wave_out_inst|q_regs~4_combout\,
	clrn => \ALT_INV_res~inputclkctrl_outclk\,
	ena => \wave_out_inst|q_regs[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \wave_out_inst|q_regs\(1));

-- Location: LCCOMB_X8_Y20_N20
\wave_out_inst|q_regs~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \wave_out_inst|q_regs~0_combout\ = (\fsm_inst|state.wave_gen~q\ & (!\finder_inst|first_reg\(0) & (!\finder_inst|first_reg\(2) & !\finder_inst|first_reg\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm_inst|state.wave_gen~q\,
	datab => \finder_inst|first_reg\(0),
	datac => \finder_inst|first_reg\(2),
	datad => \finder_inst|first_reg\(1),
	combout => \wave_out_inst|q_regs~0_combout\);

-- Location: LCCOMB_X8_Y20_N24
\wave_out_inst|q_regs~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \wave_out_inst|q_regs~1_combout\ = (\wave_out_inst|q_regs~0_combout\) # ((!\fsm_inst|state.wave_gen~q\ & \wave_out_inst|q_regs\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm_inst|state.wave_gen~q\,
	datac => \wave_out_inst|q_regs\(1),
	datad => \wave_out_inst|q_regs~0_combout\,
	combout => \wave_out_inst|q_regs~1_combout\);

-- Location: FF_X8_Y20_N25
\wave_out_inst|q_regs[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \wave_out_inst|q_regs~1_combout\,
	clrn => \ALT_INV_res~inputclkctrl_outclk\,
	ena => \wave_out_inst|q_regs[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \wave_out_inst|q_regs\(0));

ww_wave <= \wave~output_o\;
END structure;


