library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BTNCOUNTER is
	port(
		clk : in std_logic;
		res : in std_logic;
		btn : in std_logic;
		single_push : out std_logic_vector(7 downto 0);
		double_push : out std_logic_vector(7 downto 0);
		triple_push : out std_logic_vector(7 downto 0)
	);
end BTNCOUNTER;

architecture structural of BTNCOUNTER is
	-- clocckcounter signals
	signal en4, en8 : std_logic;
	signal stop_cont : std_logic;
	signal count4_end, count8_end : std_logic;
	
	-- clickcounter signals
	signal en_single, en_double, en_triple : std_logic;
	
begin
	count4: entity work.CLOCKCOUNTER
		generic map (num_clk_to_count := 4)
		port map (clk=>clk, res=>std_logic(res or stop_cont), en=>en4, count_end=>count4_end);
	count8: entity work.CLOCKCOUNTER
		generic map (num_clk_to_count := 8)
		port map (clk=>clk, res=>std_logic(res or stop_cont), en=>en8, count_end=>count8_end);
	click_single: entity work.CLICKCOUNTER
		port map (clk=>clk, res=>std_logic(res or count8_end), en=>en_single, std_logic_vector(click_count)=>single_push);
	click_double: entity work.CLICKCOUNTER
		port map (clk=>clk, res=>std_logic(res or count8_end), en=>en_double, std_logic_vector(click_count)=>double_push);
	click_triple: entity work.CLICKCOUNTER
		port map (clk=>clk, res=>std_logic(res or count8_end), en=>en_triple, std_logic_vector(click_count)=>triple_push);
	-- TODO: istanziare la fsm, controllare i segnali di controllo, verificare con la simulazione
end structural;