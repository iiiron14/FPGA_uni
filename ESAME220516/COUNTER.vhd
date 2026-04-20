library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity COUNTER is
	port(
		clk : in std_logic;
		res : in std_logic;
		en_counter : in std_logic;
		en_count_out : in std_logic;
		
		count : inout unsigned(7 downto 0);
		n : inout unsigned(7 downto 0);
		dmin : inout unsigned(7 downto 0);
		dmax : inout unsigned(7 downto 0)
	);
end COUNTER;

architecture rtl of COUNTER is
	signal ncount, nn : unsigned(7 downto 0);
	
	signal en_count_out_reg : std_logic;
	signal res_count : std_logic;
begin
	ncount <= count + 1;
	nn <= n + 1;
	res_count <= res or en_count_out_reg;
	
	reg0: process(clk, res) begin
		if res = '1' then
			dmin <= to_unsigned(255, 8);
		elsif rising_edge(clk) then
			if en_count_out = '1' then
				if count < dmin then
					dmin <= count;
				end if;
			end if;
		end if;
	end process;
	
	reg1: process(clk, res) begin
		if res = '1' then
			dmax <= to_unsigned(0,8);
		elsif rising_edge(clk) then
			if en_count_out = '1' then
				if count > dmax then
					dmax <= count;
				end if;
			end if;
		end if;
	end process;
	
	reg2: process(clk, res_count) begin
		if res_count = '1' then
			count <= to_unsigned(0,8);
		elsif rising_edge(clk) then
			if en_counter = '1' then
				count <= ncount;
			end if;
		end if;
	end process;
	
	reg3: process(clk, res) begin
		if res = '1' then
			n <= to_unsigned(0, 8);
		elsif rising_edge(clk) then
			if en_count_out = '1' then
				n <= nn;
			end if;
		end if;
	end process;
	
	reg4: process(clk, res) begin
		if res = '1' then
			en_count_out_reg <= '0';
		elsif rising_edge(clk) then
			en_count_out_reg <= en_count_out;
		end if;
	end process;
end rtl;