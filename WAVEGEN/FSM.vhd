library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FSM is
	port(
		clk : in std_logic;
		res : in std_logic;
		x : in std_logic_vector(7 downto 0);
		
		en_finder : out std_logic;
		en_wave_gen : out std_logic;
		en_wave_out : out std_logic
	);
end FSM;

architecture rtl of FSM is
	type state_type is (idle, find_ij, wave_gen, wave_out);
	signal state, nstate : state_type;
	
	-- COUNTER INST
	signal en_count : std_logic;
	signal count_end : std_logic;
	signal off : std_logic;
	
	-- EVENT_ON_X INST
	signal en_event : std_logic;
	signal x_event : std_logic;
begin
	counter_inst: entity work.COUNTER
		port map (clk=>clk, res=>res, en_count=>en_count, off=>off, count_end=>count_end);
		
	event_on_x_inst: entity work.EVENT_ON_X
		port map (clk=>clk, res=>res, en_event=>en_event, x=>x, x_event=>x_event);
	
	fsm: process(state, x_event, count_end) begin
		en_event <= '0';
		en_finder <= '0';
		en_wave_gen <= '0';
		en_wave_out <= '0';
		en_count <= '0';
		off <= '0';
		case state is
			when idle =>
				en_event <= '1';
				off <= '1';
				if x_event = '1' then
					nstate <= find_ij;
				else
					nstate <= idle;
				end if;
			when find_ij =>
				en_finder <= '1';
				nstate <= wave_gen;
			when wave_gen =>
				en_wave_gen <= '1';
				nstate <= wave_out;
			when wave_out =>
				en_wave_out <= '1';
				en_count <= '1';
				if count_end = '1' then
					nstate <= idle;
				else
					nstate <= wave_out;
				end if;
			when others =>
				nstate <= idle;
		end case;
	end process;
	
	reg: process(clk, res) begin
		if res = '1' then
			state <= idle;
		elsif rising_edge(clk) then
			state <= nstate;
		end if;
	end process;
end rtl;