library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BUTTON1 is
	port(
		clk: in std_logic;
		res : in std_logic;
		btn : in std_logic;
		
		n : out std_logic_vector(7 downto 0);
		dmin : out std_logic_vector(7 downto 0);
		dmax : out std_logic_vector(7 downto 0);
		davg : out std_logic_vector(7 downto 0);
		consecutivi : out std_logic_vector(7 downto 0);
		wave : out std_logic
	
	);
end BUTTON1;

architecture structural of BUTTON1 is
	-- FSM
	signal en_counter : std_logic;
	signal en_count_out : std_logic;
	signal en_avg : std_logic;
	signal en_wavegen : std_logic;
	signal en_cons : std_logic;
	
	-- COUNTER
	signal count : unsigned(7 downto 0);
	signal n_buff, dmin_buff, dmax_buff : unsigned(7 downto 0);
	signal davg_uns : unsigned(7 downto 0);
	
begin
	fsm_inst: entity work.FSM
		port map (clk=>clk, res=>res, btn=>btn, en_counter=>en_counter, en_count_out=>en_count_out, en_avg=>en_avg, en_wavegen=>en_wavegen,
					 en_cons=>en_cons);
	counter_inst: entity work.COUNTER
		port map (clk=>clk, res=>res, en_counter=>en_counter, en_count_out=>en_count_out, count=>count,
			n=>n_buff, dmin=>dmin_buff, dmax=>dmax_buff);
	avg_inst: entity work.AVG
		port map (clk=>clk, res=>res, en_avg=>en_avg, en_count_out=>en_count_out, en_cons=>en_cons, count=>count, davg=>davg_uns);
	wavegen_inst: entity work.WAVEGEN
		port map (clk=>clk, res=>res, en_wavegen=>en_wavegen, davg=>davg_uns, wave=>wave);
	cons_counter_inst: entity work.CONS_COUNTER
		port map (clk=>clk, res=>res, en_cons=>en_cons, davg=>davg_uns, std_logic_vector(cons)=>consecutivi);
	
	davg <= std_logic_vector(davg_uns);
	n <= std_logic_vector(n_buff);
	dmin <= std_logic_vector(dmin_buff);
	dmax <= std_logic_vector(dmax_buff);
end structural;