-----------------------------------------------------------------------------------
-- unsigned2digits
--
-- Questo componente converte un unsigned compreso tra 0 e 99 nelle due
-- cifre BCD corrispondenti
------------------------------------------------------------------------------------

library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;
  

entity unsigned2digits is
   port( n : in unsigned(5 downto 0);
         u : out unsigned(3 downto 0);
         d : out unsigned(3 downto 0) );
end unsigned2digits;


architecture A of unsigned2digits is
begin   

   process(n)
   begin
      if n<10 then
         d <= to_unsigned(0,4);
         u <= n(3 downto 0);
      elsif n<20 then
         d <= to_unsigned(1,4);
         u <= resize(n-10, 4);
      elsif n<30 then
         d <= to_unsigned(2,4);
         u <= resize(n-20, 4);
      elsif n<40 then
         d <= to_unsigned(3,4);
         u <= resize(n-30 ,4);
      elsif n<50 then
         d <= to_unsigned(4,4);
         u <= resize(n-40, 4);
      elsif n<60 then
         d <= to_unsigned(5,4);
         u <= resize(n-50, 4);
      else 
         d <= to_unsigned(0,4);
         u <= to_unsigned(0,4);
      end if;

   end process;

end A;


----------------------------------------------------------------