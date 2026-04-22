library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MULT is
	port(
		clk : in std_logic;
		res : in std_logic;
		dataa : in std_logic_vector(7 downto 0);
		datab : in std_logic_vector(7 downto 0);
		
		result : out std_logic_vector(15 downto 0)
	);
end MULT;

architecture rtl of MULT is
	signal dataa_reg, datab_reg : unsigned(7 downto 0);
	signal mult_comb, mult_reg : unsigned(15 downto 0);
begin
	process(clk, res) begin
		if res = '1' then
			dataa_reg <= to_unsigned(0, 8);
			datab_reg <= to_unsigned(0, 8);
		elsif rising_edge(clk) then
			dataa_reg <= unsigned(dataa);
			datab_reg <= unsigned(datab);
		end if;
	end process;
	
	mult_comb <= dataa_reg * datab_reg;
	-- mult_comb <= ("00000000" & dataa_reg) + ("00000000" & datab_reg); -- decommentare questa riga per vedere i LE aumentare a dismisura
	process(clk, res) begin
		if res = '1' then
			mult_reg <= to_unsigned(0, 16);
		elsif rising_edge(clk) then
			mult_reg <= mult_comb;
		end if;
	end process;
	
	result <= std_logic_vector(mult_reg);
end rtl;