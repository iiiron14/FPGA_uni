library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity SQUAREWAVE is
	port(
		clk : in std_logic;
		res : in std_logic;
		btn : in std_logic;
		
		n : out std_logic_vector(7 downto 0);
		avg : out std_logic_vector(7 downto 0)
	);
end SQUAREWAVE;

architecture rtl of SQUAREWAVE is
	signal en_count1, en_count2, en_space, en_op : std_logic;
	signal res_count1, res_count2, res_space : std_logic;
	
	signal count1, count2, space, ncount1, ncount2, nspace : unsigned(4 downto 0);
	signal min, max, nmin, nmax : unsigned(7 downto 0);
	
	signal nn, n_reg : unsigned(7 downto 0);
	signal navg, avg_reg : unsigned(8 downto 0);
	
	type state_type is (idle, count1_state, count_space, count2_state, operate, res_state);
	signal state, nstate : state_type;
begin
	reg_fsm: process(clk, res) begin
		if res = '1' then
			state <= idle;
		elsif rising_edge(clk) then
			state <= nstate;
		end if;
	end process;
	
	fsm: process(state, btn, space) begin
		en_count1 <= '0';
		en_count2 <= '0';
		en_space <= '0';
		en_op <= '0';
		res_count1 <= '0';
		res_count2 <= '0';
		res_space <= '0';
		nstate <= state;
		case state is
			when idle=>
				if btn = '1' then
					nstate <= count1_state;
				end if;
			when count1_state=>
				en_count1 <= '1';
				if btn = '0' then
					nstate <= count_space;
				end if;
			when count_space=>
				en_space <= '1';
				if btn = '1' then
					nstate <= count2_state;
				elsif space = to_unsigned(15, 5) then
					nstate <= idle;
				end if;
			when count2_state=>
				en_count2 <= '1';
				if btn = '0' then
					nstate <= operate;
				end if;
			when operate=>
				en_op <= '1';
				nstate <= res_state;
			when res_state=>
				res_count1 <= '1';
				res_count2 <= '1';
				res_space <= '1';
				nstate <= idle;
			when others=>
				nstate <= idle;
		end case;
	end process;
	
	ncount1 <= count1 + 1;
	ncount2 <= count2 + 1;
	nspace <= space + 1;
	process(clk, res, res_count1) begin
		if res = '1' or res_count1 = '1' then
			count1 <= (others=>'0');
		elsif rising_edge(clk) then
			if en_count1 = '1' then
				count1 <= ncount1;
			end if;
		end if;
	end process;
	
	process(clk, res, res_count2) begin
		if res = '1' or res_count2 = '1' then
			count2 <= (others=> '0');
		elsif rising_edge(clk) then
			if en_count2 = '1' then
				count2 <= ncount2;
			end if;
		end if;
	end process;
	
	process(clk, res, res_space) begin
		if res = '1' or res_space = '1' then
			space <= (others=>'0');
		elsif rising_edge(clk) then
			if en_space = '1' then
				space <= nspace;
			end if;
		end if;
	end process;
	
	rc1: process(count1, count2, max, min)
		variable nmax_var, nmin_var : unsigned(7 downto 0);
	begin
		nmax_var := max;
		nmin_var := min;
		if count1 <= to_unsigned(4, 5) then -- MAX
			if count2 <= to_unsigned(4, 5) then -- incrementa
				nmax_var := max + 1;
			else	-- decrementa
				nmax_var := max - 1;
			end if;
		else -- MIN
			if count2 <= to_unsigned(4,5) then
				nmin_var := min + 1;
			else
				nmin_var := min - 1;
			end if;
		end if;
		nmax <= nmax_var;
		nmin <= nmin_var;
	end process;
	
	reg1: process(clk, res) begin
		if res = '1' then
			min <= to_unsigned(120, 8);
			max <= to_unsigned(140, 8);
		elsif rising_edge(clk) then
			if en_op = '1' then
				min <= nmin;
				max <= nmax;
			end if;
		end if;
	end process;
	
	rc2: nn <= min when n_reg = max else n_reg+1;
	reg2: process(clk, res) begin
		if res = '1' then
			n_reg <= to_unsigned(120, 8);
		elsif rising_edge(clk) then
			n_reg <= nn;
		end if;
	end process;
	
	rc3: navg <= resize(min, 9) + resize(max,9);
	reg3: process(clk, res) begin
		if res = '1' then
			avg_reg <= to_unsigned(260, 9);
		elsif rising_edge(clk) then
			avg_reg <= navg;
		end if;
	end process;
	
	N <= std_logic_vector(N_reg);
	avg <= std_logic_vector(avg_reg(8 downto 1));
end rtl;
