library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dec_to_bcd is
	port( num : in unsigned(5 downto 0);
		   u : out unsigned(3 downto 0);
			d : out unsigned(3 downto 0)
			);
end dec_to_bcd;

architecture rtl of dec_to_bcd is
begin
	to_bcd: process(num) begin
		if 	num < 10  then d <= to_unsigned(0, 4); u <= resize(num,4);
		elsif num < 20  then d <= to_unsigned(1, 4); u <= resize(num-10, 4);
		elsif num < 30  then d <= to_unsigned(2, 4); u <= resize(num-20, 4);
		elsif num < 40  then d <= to_unsigned(3, 4); u <= resize(num-30, 4);
		elsif num < 50  then d <= to_unsigned(4, 4); u <= resize(num-40, 4);
		elsif num < 60  then d <= to_unsigned(5, 4); u <= resize(num-50, 4);
		elsif num < 70  then d <= to_unsigned(6, 4); u <= resize(num-60, 4);
		elsif num < 80  then d <= to_unsigned(7, 4); u <= resize(num-70, 4);
		elsif num < 90  then d <= to_unsigned(8, 4); u <= resize(num-80, 4);
		elsif	num < 100 then d <= to_unsigned(9, 4); u <= resize(num-90, 4);
		else 				      d <= to_unsigned(0, 4); u <= to_unsigned(0, 4);
		end if;
	end process;
end rtl;