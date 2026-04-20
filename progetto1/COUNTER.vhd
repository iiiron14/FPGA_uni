library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity COUNTER is
	port( res   : in  std_logic;
		   clk   : in  std_logic;
			u     : out unsigned(3 downto 0);
			d     : out unsigned(3 downto 0);
			count : inout unsigned(4 downto 0);
			count_vect : out std_logic_vector(4 downto 0) );
end COUNTER;

architecture structural of COUNTER is
signal ncount : unsigned(4 downto 0);
begin
	count_inst: entity work.contatore_comp
		port map(count=>count, ncount => ncount);
	reg_inst: entity work.FF
		port map(clk=>clk, res=>res, count=>count, ncount=>ncount);
	dec_to_bcd: entity work.dec_to_bcd
		port map(num=>count, u=>u, d=>d);
	count_vect <= std_logic_vector(count);
end structural;