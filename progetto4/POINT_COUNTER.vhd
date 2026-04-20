library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity POINT_COUNTER is
	port( start  		: in  std_logic;
			btn   		: in  std_logic;
			en_punti    : out std_logic;
			en_durata   : out std_logic;
			durata_disp : out std_logic
	);
end POINT_COUNTER;

architecture rtl of POINT_COUNTER is
type state is (idle, s1, s2);
signal stato : state;

begin
	-- Modello a macchina di Mealy, se si usasse una macchina di Moore si avrebbe un ritardo di 1 clk
	-- Non è necessario preoccuparsi di durate di btn minori di 1 clk, per motivi dati dal testo
	fsm: process(stato, btn, start)
		begin
			case stato is
				when idle => en_punti <= '0';
								 en_durata <= '0';
								 durata_disp <= '0';
								 
								 if btn = '1' then
										stato <= s1;
										en_punti <= '1';
										en_durata <= '1';
								 else
										stato <= idle;
								 end if;
				when s1 => en_punti <= '0';
							  en_durata <= '1';
							  durata_disp <= '0';
							  
							  if btn ='0' then
									stato <= idle;
									durata_disp <= '1';
									en_durata <= '0';
									en_punti <= '0';
								else
									stato <= s1;
								
							  
			
			end case;
		end process;
end rtl;