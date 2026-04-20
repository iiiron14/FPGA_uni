--
-- Decoder da cifra binaria a display 7 segmenti
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity DEC7SEG is
port(DIGIT : in unsigned(3 downto 0);
     LED: out std_logic_vector(7 downto 0));
end DEC7SEG;

architecture A of DEC7SEG is
begin

rc: process(DIGIT)
   begin
       case DIGIT is 
          when to_unsigned(0,4) => LED <= "11000000";
          when to_unsigned(1,4) => LED <= "11111001";
          when to_unsigned(2,4) => LED <= "10100100";
          when to_unsigned(3,4) => LED <= "10110000";
			 when to_unsigned(4,4) => LED <= "10011001";
          when to_unsigned(5,4) => LED <= "10010010";
          when to_unsigned(6,4) => LED <= "10000010";
          when to_unsigned(7,4) => LED <= "11111000";
          when to_unsigned(8,4) => LED <= "10000000";
          when to_unsigned(9,4) => LED <= "10010000";
          when others           => LED <= "10000110";
       end case;
   end process;
	
end A;

