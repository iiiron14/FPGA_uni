library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity WAVE_GENERATOR is
	port(
		first : in unsigned(2 downto 0);
		last  : in unsigned(2 downto 0);
		
		wave_slv : out std_logic_vector(7 downto 0)
	);
end WAVE_GENERATOR;

architecture rtl of WAVE_GENERATOR is
begin
	process(first, last)
		variable wave_slv_var : std_logic_vector(7 downto 0);
	begin
		for I in 0 to 7 loop
			if (first <= I) and (I <= last) then
				wave_slv_var(I) := '1';
			else
				wave_slv_var(I) := '0';
			end if;
		end loop;
		wave_slv <= wave_slv_var;
	end process;
end rtl;