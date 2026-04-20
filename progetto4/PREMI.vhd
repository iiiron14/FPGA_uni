library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PREMI is
	port( CK     : in std_logic;
		   RES    : in std_logic;
		   START  : in std_logic;
		   BTN1   : in std_logic;
		   BTN2   : in std_logic;
		   PUNTI1 : out unsigned(2 downto 0);
		   PUNTI2 : out unsigned(2 downto 0) );
end PREMI;

architecture structural of PREMI is

begin

end structural;