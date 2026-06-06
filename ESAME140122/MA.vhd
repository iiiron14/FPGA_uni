library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MA is
	port(
		clk : in std_logic;
		res : in std_logic;
		
		dato : in std_logic_vector(7 downto 0);
		ready : in std_logic;
		mode : in std_logic_vector(1 downto 0);
		
		mov_avg : out std_logic_vector(7 downto 0);
		npeaks : out std_logic_vector(7 downto 0)
	);
end MA;

architecture rtl of MA is
	type dato_reg_arr_type is array (0 to 7) of unsigned(7 downto 0);
	signal dato_reg_arr : dato_reg_arr_type;
	
	signal n : unsigned(3 downto 0);
	signal ma : unsigned(7 downto 0);
	signal mov_avg_reg : unsigned(7 downto 0);
	signal max_reg : unsigned(7 downto 0);
	signal is_max : std_logic;
	signal npeaks_reg, npeaks_next : unsigned(7 downto 0);
begin
	
	rc0: n <= to_unsigned(8, 4) when mode="11" else to_unsigned(4, 4) when mode="10" else to_unsigned(2, 4) when mode="01" else to_unsigned(1, 4);
	
	shift_reg: process(clk, res) begin
		if res='1' then
			dato_reg_arr(0 to 7) <= (others => to_unsigned(0, 8));
		elsif rising_edge(clk) then
			if ready='1' then
				dato_reg_arr(0) <= unsigned(dato);
				dato_reg_arr(1 to 7) <= dato_reg_arr(0 to 6);
			end if;
		end if;
	end process;
	
	rc1: process(n, dato_reg_arr)
		variable partial_sum : unsigned(10 downto 0);
	begin
		partial_sum := (others=>'0');
		for i in 0 to 7 loop
			if i <= n-1 then
				partial_sum := partial_sum + resize(dato_reg_arr(i), 11);
			end if;
		end loop;
		ma <= partial_sum(7 downto 0);
		if n=8 then
			ma <= partial_sum(10 downto 3);
		elsif n=4 then
			ma <= partial_sum(9 downto 2);
		elsif n=2 then
			ma <= partial_sum(8 downto 1);
		end if;
	end process;
	
	reg1: process(clk, res) begin
		if res = '1' then
			mov_avg_reg <= to_unsigned(0, 8);
		elsif rising_edge(clk) then
			mov_avg_reg <= ma;
		end if;
	end process;
	
	reg2: process(clk, res) begin
		if res = '1' then
			max_reg <= to_unsigned(0, 8);
		elsif rising_edge(clk) then
			if is_max = '1' then
				max_reg <= mov_avg_reg;
			end if;
		end if;
	end process;
	
	rc2: is_max <= '1' when mov_avg_reg > max_reg else '0';
	
	reg3: process(clk, res) begin
		if res = '1' then
			npeaks_reg <= to_unsigned(0,8);
		elsif rising_edge(clk) then
			if is_max = '1' then
				npeaks_reg <= npeaks_next;
			end if;
		end if;
	end process;
	
	rc3: npeaks_next <= npeaks_reg + 1;
	
	buf0: mov_avg <= std_logic_vector(mov_avg_reg);
	buf1: npeaks <= std_logic_vector(npeaks_reg);

end rtl;