library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contatore_comp is
	port( count  : in  unsigned(4 downto 0);
			ncount : out unsigned(4 downto 0) );
end contatore_comp;

architecture rtl of contatore_comp is
	begin
	rc0: ncount <= to_unsigned(0, 5) when count = 20 else
						count + 1;
end rtl;