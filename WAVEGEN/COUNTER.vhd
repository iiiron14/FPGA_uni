library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity COUNTER is
	port(
		clk : in std_logic;
		res : in std_logic;
		en_count : in std_logic;
		off : in std_logic;
		
		count_end : out std_logic
	);
end COUNTER;

architecture rtl of COUNTER is
	signal count, ncount : unsigned(2 downto 0);
	signal res_count : std_logic;
begin
	res_count <= res or off;
	ncount <= count + 1;
	reg: process(clk, res_count) begin
		if res_count = '1' then
			count <= to_unsigned(0, 3);
		elsif rising_edge(clk) then
			if en_count = '1' then
				count <= ncount;
			end if;
		end if;
	end process;
	count_end <= '1' when count = to_unsigned(7,3) else '0';
end rtl;