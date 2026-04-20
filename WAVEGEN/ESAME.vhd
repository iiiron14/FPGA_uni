library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ESAME is
	port (
		clk : in std_logic;
		res : in std_logic;
		x   : in std_logic_vector(7 downto 0);
		
		wave : out std_logic
	);
end ESAME;

architecture structural of ESAME is
	-- FSM INST
	signal en_finder : std_logic;
	signal en_wave_gen : std_logic;
	signal en_wave_out : std_logic;
	
	-- FINDER INST
	signal first, last : unsigned(2 downto 0);
	
	-- WAVE_GENERATOR INST
	signal wave_slv : std_logic_vector(7 downto 0);
begin
	fsm_inst: entity work.FSM
		port map (clk=>clk, res=>res, x=>x, en_finder=>en_finder, en_wave_gen=>en_wave_gen, en_wave_out=>en_wave_out);
	
	finder_inst: entity work.FINDER
		port map (clk=>clk, res=>res, x=>x, en_finder=>en_finder, first_reg=>first, last_reg=>last);
	
	wave_gen_inst: entity work.WAVE_GENERATOR
		port map (first=>first, last=>last, wave_slv=>wave_slv);
	
	wave_out_inst: entity work.WAVE_OUT_WRITE
		port map (clk=>clk, res=>res, en_wave_gen=>en_wave_gen, en_wave_out=>en_wave_out, wave_slv=>wave_slv, wave=>wave);
end structural;