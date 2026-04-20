library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bcd_to_7seg is
	port( num : in unsigned(3 downto 0);
			seg : out std_logic_vector(6 downto 0)
	);
end bcd_to_7seg;

architecture rtl of bcd_to_7seg is
begin
	dec7seg: process(num)
	-- variable n : natural;
	begin
	-- n := to_integer(digit);
		case num is
			when "0000" => seg <= "1000000";
			when "0001" => seg <= "1111001";
			when "0010" => seg <= "0100100";
			when "0011" => seg <= "0110000";
			when "0100" => seg <= "0011001";
			when "0101" => seg <= "0010010";
			when "0110" => seg <= "0000010";
			when "0111" => seg <= "0111000";
			when "1000" => seg <= "0000000";
			when "1001" => seg <= "0010000";
			when others => seg <= "1111111";
		end case;
	end process;
end rtl;