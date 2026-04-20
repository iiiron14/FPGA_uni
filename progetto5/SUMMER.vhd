library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SUMMER is
	port(
		clk : in std_logic;
		res : in std_logic;
		start : in std_logic;
		read_en : in std_logic;
		sensordata : in unsigned(11 downto 0);
		sensordata_sum_in : in unsigned(15 downto 0);
		sensordata_sum_out : out unsigned(15 downto 0)
	);
end SUMMER;

architecture rtl of SUMMER is
	signal sensordata_sum_reg : unsigned(15 downto 0);
begin
	reg: process(clk, res, start) begin
		if res='1' or start='1' then
			sensordata_sum_reg <= to_unsigned(0, 16);
		elsif rising_edge(clk) then
			if read_en = '1' then
				sensordata_sum_reg <= sensordata_sum_in;
			end if;
		end if;
	end process;
	
	rc0: sensordata_sum_out <= sensordata + sensordata_sum_reg;
	
end rtl;