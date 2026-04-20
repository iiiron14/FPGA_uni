library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity AVG is
	port(
		clk : in std_logic;
		res : in std_logic;
		en_avg : in std_logic;
		en_count_out : in std_logic;
		en_cons : in std_logic;
		count : in unsigned(7 downto 0);
		
		davg : out unsigned(7 downto 0)
	);
end AVG;

architecture rtl of AVG is
	signal sum, nsum : unsigned(10 downto 0);
	signal avg : unsigned(7 downto 0);
	signal res_sum : std_logic;
	
	signal en_cons_reg : std_logic;
begin
	nsum <= sum + resize(count, 11);
	res_sum <= res or en_cons_reg;
	avg <= sum(10 downto 3);
	
	reg0: process(clk, res_sum) begin
		if res_sum = '1' then
			sum <= to_unsigned(0,11);
		elsif rising_edge(clk) then
			if en_count_out = '1' then
				sum <= nsum;
			end if;
		end if;
	end process;
	
	reg1: process(clk, res) begin
		if res = '1' then
			en_cons_reg <= '0';
		elsif rising_edge(clk) then
			en_cons_reg <= en_cons;
		end if;
	end process;
	
	reg2: process(clk,res) begin
		if res = '1' then
			davg <= to_unsigned(0, 8);
		elsif rising_edge(clk) then
			if en_avg = '1' then
				davg <= avg;
			end if;
		end if;
	end process;
end rtl;