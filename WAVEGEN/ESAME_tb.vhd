library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ESAME_tb is
end ESAME_tb;

architecture behavioral of ESAME_tb is
	signal clk  : std_logic := '0';
	signal res  : std_logic := '0';
	signal wave : std_logic;
	signal x    : std_logic_vector(7 downto 0);
	
	
begin
	duv: entity work.ESAME
		port map (clk=>clk, res=>res, x=>x, wave=>wave);
	
	clk <= not clk after 10 ns;
	res <= '1', '0' after 40 ns;
	
	stimuli: process
		variable wave_behaviour : std_logic_vector(7 downto 0);
		alias first_internal : unsigned(2 downto 0) is
			<< signal duv.first : unsigned(2 downto 0) >>;
		alias last_internal : unsigned(2 downto 0) is
			<< signal duv.last : unsigned(2 downto 0) >>;
	begin
		wait until res='0';
		wait for 5 ns;
		report "Reset finito, inizio stimoli..." severity note;
		
		-- TOTAL SIMULATION TIME = 256*(60 + 20*8)+45 = 56.365u
		for i in 0 to 2**8-1 loop
			x <= std_logic_vector(to_unsigned(i, 8));
			wait for 60 ns;
			for j in 0 to 7 loop
				if (first_internal <= j) and (j <= last_internal) then
					wave_behaviour(j) := '1';
				else
					wave_behaviour(j) := '0';
				end if;
				
				assert wave = wave_behaviour(j)
					report "Error: wave value is different from behaviour." & LF & "Actual: " & to_string(wave) & ", Expected: " & 
					to_string(wave_behaviour(j))
					severity failure;
				wait for 20 ns;
			end loop;
		end loop;
		
		report "Simulation ended with no errors" severity note;
		wait for 60 ns;
	end process;
end behavioral;