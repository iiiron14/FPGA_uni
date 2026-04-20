library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PWM is
	port(
		clk : in std_logic;
		res : in std_logic;
		thr : in unsigned(3 downto 0);
		
		pwm_reg : out std_logic
	);
end PWM;

architecture rtl of PWM is
	signal count, ncount : unsigned(15 downto 0);
	signal pwm : std_logic;
	
	signal thr_limited : unsigned(3 downto 0);
begin
	ncount <= count + 1;
	reg0: process(clk,res) begin
		if res = '1' then
			count <= to_unsigned(0, 16);
		elsif rising_edge(clk) then
			count <= ncount;
		end if;
	end process;
	
	thr_limited <= to_unsigned(8, 4) when thr = to_unsigned(9, 4) else thr;
	pwm <= '1' when resize(count(15 downto 13), 4) < thr_limited else '0';
	
	reg1: process(clk, res) begin
		if res = '1' then
			pwm_reg <= '0';
		elsif rising_edge(clk) then
			pwm_reg <= pwm;
		end if;
	end process;
end rtl;