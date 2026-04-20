library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FSM is
	port(
		clk : in std_logic;
		res : in std_logic;
		btn : in std_logic;
		
		en_counter : out std_logic;
		en_count_out : out std_logic;
		en_avg : out std_logic;
		en_wavegen : out std_logic;
		en_cons : out std_logic
	);
end FSM;

architecture rtl of FSM is

type state_type is (idle, btn_down, btn_up, avg_out, gen_wave);

signal state : state_type;
signal nstate : state_type;

signal press, npress : unsigned(2 downto 0);
signal first_wavegen, nfirst_wavegen : std_logic;

begin
	reg: process(clk, res) begin
		if res='1' then
			state <= idle;
		elsif rising_edge(clk) then
			state <= nstate;
		end if;
	end process;
	
	process(state, btn, press)
	begin
		en_counter <= '0';
		en_count_out <= '0';
		en_avg <= '0';
		npress <= press;
		nfirst_wavegen <= first_wavegen;
		en_wavegen <= first_wavegen;
		en_cons <= '0';
		case state is
			when idle =>
				if btn = '1' then
					nstate <= btn_down;
				else
					nstate <= idle;
				end if;
			when btn_down =>
				en_counter <= '1';
				if btn = '0' then
					nstate <= btn_up;
				else
					nstate <= btn_down;
				end if;
			when btn_up =>
				npress <= press + 1;
				en_count_out <= '1';
				if press = to_unsigned(7,3) then
					nstate <= avg_out;
				else
					nstate <= idle;
				end if;
			when avg_out =>
				en_avg <= '1';
				npress <= to_unsigned(0, 3);
				nstate <= gen_wave;
			when gen_wave =>
				nfirst_wavegen <= '1';
				en_wavegen <= '1';
				en_cons <= '1';
				nstate <= idle;
			when others =>
				nstate <= idle;
		end case;
	end process;
	
	process(clk, res) begin
		if res = '1' then
			press <= to_unsigned(0, 3);
		elsif rising_edge(clk) then
			press <= npress;
		end if;
	end process;
	
	process(clk, res) begin
		if res = '1' then
			first_wavegen <= '0';
		elsif rising_edge(clk) then
			first_wavegen <= nfirst_wavegen;
		end if;
	end process;
end rtl;