library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FSM is
	port(
		btn : in std_logic;
		count4_end : in std_logic;
		count7_end : in std_logic;
		stop_count : out std_logic;
		en_single : out std_logic;
		en_double : out std_logic;
		en_triple : out std_logic
	);
end FSM;

architecture rtl of FSM is
	type state_type is (idle, push1, rel1, push2, rel2, push3, rel3);
	signal state, nstate : state_type;
begin
	fsm: process(state, btn, count4_end, count7_end) begin
		case state is
			when idle =>
				en_single <= '0'; en_double <= '0'; en_triple <= '0';
				stop_cont <= '1';
				if btn = '0' then
					nstate <= push1;
				else
					nstate <= idle;
				end if;
			when push1 =>
				en_single <= '0'; en_double <= '0'; en_triple <= '0';
				stop_cont <= '0';
				if count7_end then
					nstate <= idle;
				elsif btn = '1' then
					nstate <= rel1;
					stop_cont = '1';
				else
					nstate <= push1;
				end if;
			when rel1 =>
				en_single <= '0'; en_double <= '0'; en_triple <= '0';
				stop_cont <= '0';
				if count4_end = '1' then
					nstate <= idle;
					en_single <= '1';
				elsif btn = '0' then
					nstate <= push2;
					stop_cont <= '1';
				else
					nstate <= rel1;
				end if;
			when push2 =>
				en_single <= '0'; en_double <= '0'; en_triple <= '0';
				stop_cont <= '0';
				if count8_end = '1' then
					nstate <= idle;
				elsif btn = '0' then
					nstate <= rel2;
					stop_cont <= '1';
				else
					nstate <= push2;
				end if;
				
				-- TO DO: stati successivi
			when rel2 =>
				en_single <= '0'; en_double <= '0'; en_triple <= '0';
				stop_cont <= '1';
			when push3 =>
				en_single <= '0'; en_double <= '0'; en_triple <= '0';
				stop_cont <= '1';
			when rel3 =>
				en_single <= '0'; en_double <= '0'; en_triple <= '0';
				stop_cont <= '1';
			when others =>
				en_single <= '0'; en_double <= '0'; en_triple <= '0';
				stop_cont <= '1';
			
		end case;
	end process;
end rtl;