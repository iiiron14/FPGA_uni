library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity BALL is
	port(
		clk : in std_logic;
		res : in std_logic;
		
		new_point : in std_logic;
		
		x : inout unsigned(3 downto 0);
		y : inout unsigned(3 downto 0);
		
		pos1 : in unsigned(3 downto 0);
		pos2 : in unsigned(3 downto 0)
	);
end BALL;

architecture rtl of BALL is
	signal nx, ny : unsigned(3 downto 0);
	signal hit : std_logic;
	
	type ball_state_type is (down_right, down_left, up_right, up_left);
	signal state, nstate : ball_state_type;
begin
	process(clk, res) begin
		if res = '1' then
			state <= down_right;
		elsif rising_edge(clk) then
			state <= nstate;
		end if;
	end process;
	
	process(state, x, y, hit) begin
		case state is
			when down_right=>
				nx <= x+1;
				ny<=y+1;
				if hit='1' then
					nstate <= up_right;
				elsif x=14 then
					nstate <= down_left;
				else
					nstate <= down_right;
				end if;
			when down_left=>
				nx <= x-1;
				ny <= y+1;
				if hit = '1' then
					nstate <= up_left;
				elsif x = 1 then
					nstate <= down_right;
				else
					nstate <= down_left;
				end if;
			when up_right=>
				nx <= x+1;
				ny <= y-1;
				if hit = '1' then
					nstate <= down_right;
				elsif x = 14 then
					nstate <= up_left;
				else
					nstate <= up_right;
				end if;
			when up_left=>
				nx <= x-1;
				ny <= y-1;
				if hit = '1' then
					nstate <= down_left;
				elsif x=1 then
					nstate <= up_right;
				else
					nstate <= up_left;
				end if;
			when others=>
				nx <= to_unsigned(1,4);
				ny <= to_unsigned(1,4);
				nstate <= up_right;
		end case;
	end process;
	
	process(nx, ny, pos1, pos2) begin
		if (nx = pos1) or (nx=pos1-1) or (nx=pos1+1) then
			hit <= '1';
		elsif (nx = pos2) or (nx=pos2-1) or (nx=pos2+1) then
			hit <= '1';
		else
			hit <= '0';
		end if;
	end process;
	
	process(clk, res, new_point) begin
		if (res = '1') or (new_point='1') then
			x <= to_unsigned(1, 4);
			y <= to_unsigned(1, 4);
		elsif rising_edge(clk) then
			x <= nx;
			y <= ny;
		end if;
	end process;
end rtl;




























