library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SERIAL_RX is
	port( clk    : in std_logic;
			res    : in std_logic;
			sample : in std_logic;
			serial : in std_logic;
			dato   : inout std_logic_vector(3 downto 0)
	);
end SERIAL_RX;

architecture rtl of SERIAL_RX is

begin
	shift_reg: process(res, clk)
		begin
			if res='1' then dato <= (others => '0');
			elsif rising_edge(clk) then
				if sample='1' then
					dato(3 downto 0) <= serial & dato(3 downto 1); -- e invece (serial, dato(3 downto 1)) ?
				end if;
			end if;
		end process;
	
end rtl;