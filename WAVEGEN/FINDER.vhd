library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FINDER is
	port(
		clk : in std_logic;
		res : in std_logic;
		en_finder : in std_logic;
		x : in std_logic_vector(7 downto 0);
		
		-- CAMBIAMENTO FIRST_REG IN FIRST E LAST_REG IN LAST
		first_reg : out unsigned(2 downto 0);
		last_reg  : out unsigned(2 downto 0)
	);
end FINDER;

architecture rtl of FINDER is
	signal first, last : unsigned(2 downto 0);
	
begin
	regs: process(clk, res) begin
		if res='1' then
			first_reg <= to_unsigned(0, 3);
			last_reg <= to_unsigned(0, 3);
		elsif rising_edge(clk) then
			if en_finder = '1' then
				first_reg <= first;
				last_reg <= last;
			end if;
		end if;
	end process;
	
	rc_ij: process(x)
		variable first_var, last_var : integer range 0 to 7;
		variable first_found : std_logic;
	begin
		first_var := 0;
		last_var := 0;
		first_found := '0';
		for I in 0 to 7 loop
			if x(I) = '1' then
				last_var := I;
				if first_found = '0' then
					first_var := I;
					first_found := '1';
				end if;
			end if;
		end loop;
		first <= to_unsigned(first_var, 3);
		last <= to_unsigned(last_var, 3);
	end process;
end rtl;