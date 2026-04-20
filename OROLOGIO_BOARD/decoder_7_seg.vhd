library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity decoder_7_seg is
	port(
		digit : in  unsigned(3 downto 0);
		seg   : out std_logic_vector(6 downto 0)
	);
end decoder_7_seg;

architecture rtl of decoder_7_seg is
begin
	dec7seg: process(digit)
		variable n : natural;
	begin
		n := to_integer(digit);
		case n is
			when 0 => seg <= "1000000";
			when 1 => seg <= "1111001";
			when 2 => seg <= "0100100";
			when 3 => seg <= "0110000";
			when 4 => seg <= "0011001";
			when 5 => seg <= "0010010";
			when 6 => seg <= "0000010";
			when 7 => seg <= "1111000";
			when 8 => seg <= "0000000";
			when 9 => seg <= "0010000";
			when others => seg <= "1111111";
			end case;
	end process;
end rtl;