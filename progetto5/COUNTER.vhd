library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity COUNTER is
	port(
		clk : in std_logic;
		res : in std_logic;
		start : in std_logic;
		count_en : in std_logic;
		count_end : out std_logic
	);
end COUNTER;

architecture rtl of COUNTER is
	signal count : unsigned(3 downto 0);
	signal ncount : unsigned(3 downto 0);
begin
	reg: process(clk, res, start) begin
		if res='1' or start='1' then
			count <= to_unsigned(0, 4);
		elsif rising_edge(clk) then
			if count_en = '1' then
				count <= ncount;
			end if;
		end if;
	end process;
	
	rc0: ncount <= count + 1;
	rc1: count_end <= '1' when count = 15 else '0';
end rtl;