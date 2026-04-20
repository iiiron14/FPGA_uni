library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CLOKCOUNTER is
	generic(
		num_clk_to_count : positive range 1 to 8;
	);
	port(
		clk : in std_logic;
		res : in std_logic;
		en : in std_logic;
		count_end : out std_logic
	);
end CLOKCOUNTER;

architecture rtl of CLOCKCOUNTER is
	signal count : unsigned(2 downto 0);
	signal ncount : count'subtype;
begin
	reg: process(clk, res) begin
		if res = '1' then
			count <= to_unsigned(0, count'length);
		elsif rising_edge(clk) then
			if en = '1' then
				count <= ncount;
			end if;
		end if;
	end process;
	
	rc0: ncount <= count + 1;
	rc1: count_end <= '1' when count = num_clk_to_count else '0';
end rtl;