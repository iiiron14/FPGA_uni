library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity COUNTER is
	port(
		clk : in std_logic;
		res : in std_logic;
		
		count_out : out unsigned(5 downto 0)
	);
end COUNTER;

architecture rtl of COUNTER is
	-- TICK signals
	signal tick : std_logic;
	signal t, nt : unsigned(25 downto 0);
	
	-- COUNT signals
	signal count, ncount : unsigned(5 downto 0);
begin
	rc0_tick: nt <= to_unsigned(0, 26) when tick = '1' else t+1;
	reg_tick: process(clk, res) begin
		if res = '1' then
			t <= to_unsigned(0, 26);
		elsif rising_edge(clk) then
			t <= nt;
		end if;
	end process;
	
	rc1_tick: tick <= '1' when t = to_unsigned(50_000_000-1, 26) else '0';
	
	rc0_count: ncount <= to_unsigned(0, 6) when tick = '1' and count=to_unsigned(59, 6) else
		count+1 when tick='1' else count;
	reg_count: process(clk, res) begin
		if res = '1' then
			count <= to_unsigned(0, 6);
		elsif rising_edge(clk) then
			count <= ncount;
		end if;
	end process;
	
	count_out <= count;
end rtl;