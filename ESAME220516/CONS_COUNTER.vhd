library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CONS_COUNTER is
	port(
		clk : in std_logic;
		res : in std_logic;
		en_cons : in std_logic;
		davg : in unsigned(7 downto 0);
		
		cons : out unsigned(7 downto 0)
	);
end CONS_COUNTER;

architecture rtl of CONS_COUNTER is
	
begin
	process(davg)
		variable current, max : natural range 0 to 8;
	begin
		current := 0;
		max := 0;
		
		for i in 0 to 7 loop
			if davg(i) = '1' then
				current := current + 1;
			else 
				current := 0;
			end if;
			
			if current > max then
				max := current;
			end if;
		end loop;
		
		cons <= to_unsigned(max, 8);
	end process;
end rtl;