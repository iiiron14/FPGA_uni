library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity WATCH_DOG is
	port( clk    : in  std_logic;
			res	 : in  std_logic;
			serial : in  std_logic;
			ready  : out std_logic;
			sample : out std_logic
	);
end WATCH_DOG;

architecture rtl of WATCH_DOG is
type stato is (idle, s1, s2, s3, s4, s5);
signal cs, ns : stato;

begin
	wd_fsm: process(cs, serial)
	begin
		case cs is
			when idle => ready<='0'; sample<='0';
				if serial ='0' then ns <= s1; 
				else ns <=idle;
				end if;
			when s1 => ready<='0'; sample<='1'; ns <= s2;
			when s2 => ready<='0'; sample<='1'; ns <= s3;
			when s3 => ready<='0'; sample<='1'; ns <= s4;
			when s4 => ready<='0'; sample<='1'; ns <= s5;
			when s5 => ready<='1'; sample<='0'; ns <= idle;
			when others => ready<='0'; sample<='0'; ns <= idle;
		end case;
	end process;
	
	reg_fsm: process(clk, res) begin
		if res='1' then cs<=idle;
		elsif rising_edge(clk) then cs <= ns;
		end if;
	end process;
	
end rtl;