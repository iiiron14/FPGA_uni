library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity AVG is
	port(
		clk : in std_logic;
		res : in std_logic;
		sensordata_sum : in unsigned(15 downto 0);
		mean_en : in std_logic;
		average : out unsigned(11 downto 0)
	);
end AVG;

architecture rtl of AVG is

begin
	reg: process(clk, res) begin
		if res='1' then
			average <= to_unsigned(0, 12);
		elsif rising_edge(clk) then
			if mean_en = '1' then
				average <= sensordata_sum(15 downto 4);
			end if;
		end if;
	end process;
end rtl;