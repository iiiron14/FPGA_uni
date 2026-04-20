library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity EVENT_ON_X is
	port(
		clk : in std_logic;
		res : in std_logic;
		en_event : in std_logic;
		x   : in std_logic_vector(7 downto 0);
		
		x_event : out std_logic
	);
end EVENT_ON_X;

architecture rtl of EVENT_ON_X is
	signal x_reg : std_logic_vector(x'range);
begin
	reg: process(clk, res) begin
		if res = '1' then
			x_reg <= x;
		elsif rising_edge(clk) then
			if en_event = '1' then
				x_reg <= x;
			end if;
		end if;
	end process;
	
	x_event <= '1' when x /= x_reg else '0';
end rtl;