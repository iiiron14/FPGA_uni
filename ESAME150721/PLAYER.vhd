library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PLAYER is
	port(
		clk : in std_logic;
		res : in std_logic;
		
		l : in std_logic;
		r : in std_logic;
		
		y : in unsigned(3 downto 0);
		
		new_point : in std_logic;
		position : inout unsigned(3 downto 0)
	);
end PLAYER;

architecture rtl of PLAYER is
	signal nposition : unsigned(3 downto 0);
	signal npoint : unsigned(3 downto 0);
	
	type player_state_type is (start, left_s, right_s, stop_left, stop_right);
	signal state, nstate : player_state_type;
begin
	process(state, position, l, r) begin
		case state is
			when start=>
				nposition <= to_unsigned(7, 4);
				if l='1' then
					nstate <= left_s;
				elsif r='1' then
					nstate <= right_s;
				else
					nstate <= start;
				end if;
			when left_s=>
				nposition <= position-1;
				if r = '1' then
					nstate <= right_s;
				elsif position=2 then
					nstate <= stop_left;
				else
					nstate <= left_s;
				end if;
			when right_s=>
				nposition <= position+1;
				if l='1' then
					nstate <= left_s;
				elsif position = 13 then
					nstate <= stop_right;
				else
					nstate <= right_s;
				end if;
			when stop_left=>
				if r='1' then
					nstate <= right_s;
				else
					nstate <= stop_left;
				end if;
			when stop_right=>
				if l = '1' then
					nstate <= left_s;
				else
					nstate <= stop_right;
				end if;
			when others=>
				nstate <= start;
		end case;
	end process;
	
	process(clk, res, new_point) begin
		if (res='1' or new_point ='1') then
			state <= start;
		elsif rising_edge(clk) then
			state <= nstate;
		end if;
	end process;
	
	process(clk, res) begin
		if res = '1' then
			position <= to_unsigned(7, 4);
		elsif rising_edge(clk) then
			position <= nposition;
		end if;
	end process;
end rtl;
































