library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg is
	port( clk   : in std_logic;
			res	: in std_logic;
			nx  	: in std_logic_vector(3 downto 0);
			ready : in std_logic;
			x   	: out std_logic_vector(3 downto 0)
	);
end reg;

architecture rtl of reg is
begin
	reg: process(clk, res) begin
		if res = '1' then x <= (others=>'0');
		elsif rising_edge(clk) then
			if ready='1' then x <= nx;
			end if;
		end if;
	end process;
end rtl;