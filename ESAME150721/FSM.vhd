library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FSM is
	port(
		clk : in std_logic;
		res : in std_logic;
		
		posx : in unsigned(3 downto 0);
		posy : in unsigned(3 downto 0);
		
		en_p1 : out std_logic;
		en_p2 : out std_logic;
		new_point : out std_logic
	);
end FSM;

architecture rtl of FSM is
	type state_type is (idle, p1_won, p2_won);
	signal state, nstate : state_type;
begin
	reg: process(clk, res) begin
		if res = '1' then
			state <= idle;
		elsif rising_edge(clk) then
			state <= nstate;
		end if;
	end process;
	
	fsm_rc: process(state, posx, posy) begin
		en_p1 <= '0';
		en_p2 <= '0';
		new_point <= '0';
		case state is
			when idle=>
				if posy=15 then
					nstate <= p1_won;
				elsif posy=0 then
					nstate <= p2_won;
				else
					nstate <= idle;
				end if;
			when p1_won=>
				new_point <= '1';
				en_p1 <= '1';
				nstate <= idle;
			when p2_won=>
				new_point <= '1';
				en_p2 <= '1';
				nstate <= idle;
			when others=>
				nstate <= idle;
		end case;
	end process;
end rtl;