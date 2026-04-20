library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FF is
	port( res    : in    std_logic;
			clk    : in    std_logic;
			count  : out   unsigned(4 downto 0);
			ncount : in    unsigned(4 downto 0) );
end FF;

architecture rtl of FF is
begin
reg0: process(res, clk) begin
	if res='1' then count <= to_unsigned(0, 5);
	elsif rising_edge(clk) then count <= ncount;
	end if;
	end process;
end rtl;