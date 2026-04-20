library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ROUND_TIMER is
	port( clk 		 : in std_logic;
			res 		 : in std_logic;
			en  		 : in std_logic;
			end_round : out std_logic
	);
end ROUND_TIMER;

architecture rtl of ROUND_TIMER is
signal count : unsigned(4 downto 0);
signal ncount : unsigned(4 downto 0);

begin
	rc0: ncount <= count+1;
	
	rc1: end_round <= '1' when count=19 else '0';
	
	reg0: process(clk, res) begin
		if res='1' then count <= to_unsigned(0, 5);
		elsif rising_edge(clk) then
			if en='1' then count <= ncount;
			end if;
		end if;
	end process;
end rtl;