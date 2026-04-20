library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dec_to_bcd is
	port(	num : in  unsigned(4 downto 0);
			u   : out unsigned(3 downto 0);
			d   : out unsigned(3 downto 0)
	);
end dec_to_bcd;

architecture rtl of dec_to_bcd is
begin
dec_bcd: process(num) begin
	if    num < 10 then u <= resize(num,4);
						     d <= to_unsigned(0, 4);
	elsif num < 20 then u <= resize(num-10,4);
							  d <= to_unsigned(1, 4);
	elsif num < 30 then u <= resize(num-20,4);
							  d <= to_unsigned(2, 4);
	else 
		u <= to_unsigned(0,4);
		d <= to_unsigned(0,4);
	end if;
	end process;
end rtl;