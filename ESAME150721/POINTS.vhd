library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity POINTS is
	port(
		clk : in std_logic;
		res : in std_logic;
		
		en_p1 : in std_logic;
		en_p2 : in std_logic;
		
		points1 : inout unsigned(3 downto 0);
		points2 : inout unsigned(3 downto 0)
	);
end POINTS;

architecture rtl of POINTS is
	signal np1, np2 : unsigned(3 downto 0);
begin
	np1 <= points1+1;
	np2 <= points2+1;
	
	process(clk, res) begin
		if res = '1' then
			points1 <= to_unsigned(0, 4);
		elsif rising_edge(clk) then
			if en_p1='1' then
				points1 <= np1;
			end if;
		end if;
	end process;
	
	process(clk, res) begin
		if res = '1' then
			points2 <= to_unsigned(0, 4);
		elsif rising_edge(clk) then
			if en_p2='1' then
				points2 <= np2;
			end if;
		end if;
	end process;
end rtl;