library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity WAVEGEN is
	port(
		clk : in std_logic;
		res : in std_logic;
		en_wavegen : in std_logic;
		davg : in unsigned(7 downto 0);
		
		wave : out std_logic
	);
end WAVEGEN;

architecture rtl of WAVEGEN is
	signal t,nt : unsigned(7 downto 0);
begin
	nt <= to_unsigned(0,8) when t=davg else t+1;
	reg0: process(clk, res) begin
		if res = '1' then
			wave <= '0';
		elsif rising_edge(clk) then
			if en_wavegen = '1' then
				if t=davg then
					wave <= '0';
				else
					wave <= '1';
				end if;
			end if;
		end if;
	end process;
	
	reg1: process(clk, res) begin
		if res='1' then
			t <= to_unsigned(0, 8);
		elsif rising_edge(clk) then
			if en_wavegen = '1' then
				t <= nt;
			end if;
		end if;
	end process;
end rtl;