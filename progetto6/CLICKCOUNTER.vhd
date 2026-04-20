library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CLICKCOUNTER is
	port(
		clk : in std_logic;
		en  : in std_logic;
		res : in std_logic;
		click_count : out unsigned(7 downto 0)
	);
end CLICKCOUNTER;

architecture rtl of CLICKCOUNTER is
	signal nclick_count : click_count'subtype;
begin
	reg: process(clk, res) begin
		if res = '1' then
			click_count <= to_unsigned(0, 8);
		elsif rising_edge(clk) then
			if en = '1' then
				click_count <= nclick_count;
			end if;
		end if;
	end process;
	
	rc: nclick_count <= click_count + 1;
end rtl;