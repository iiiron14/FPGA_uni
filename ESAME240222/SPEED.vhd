library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity SPEED is
	port(
		clk : in std_logic;
		res : in std_logic;
		
		cl1 : in std_logic;
		cl2 : in std_logic;
		
		num_v : out std_logic_vector(7 downto 0);
		num_v_oltre : out std_logic_vector(7 downto 0);
		v : out std_logic_vector(7 downto 0)
	);
end SPEED;

architecture rtl of SPEED is
	-- Registered signals
	signal num_v_reg, num_v_next : unsigned(7 downto 0);
	signal count, ncount : unsigned(8 downto 0);
	signal km_h, km_h_reg : unsigned(7 downto 0);
	signal count_over, ncount_over : unsigned(7 downto 0);
	
	-- Enables & resets
	signal en_num_v : std_logic;
	signal en_count : std_logic;
	signal res_count : std_logic;
	signal res_reg1 : std_logic;
	signal en_km_h : std_logic;
	signal is_over : std_logic;
	signal en_over : std_logic;
	
	-- States
	type state_type is (idle, start, counting, stop, over_count);
	signal state, nstate : state_type;
begin
	rc0: num_v_next <= num_v_reg+1;
	reg0: process(clk, res) begin
		if res='1' then
			num_v_reg <= (others=>'0');
		elsif rising_edge(clk) then
			if en_num_v = '1' then
				num_v_reg <= num_v_next;
			end if;
		end if;
	end process;
	
	rc1: ncount <= count+1;
	res_reg1 <= res or res_count;
	reg1: process(clk, res_reg1) begin
		if res_reg1 = '1' then
			count <= (others=>'0');
		elsif rising_edge(clk) then
			if en_count = '1' then
				count <= ncount;
			end if;
		end if;
	end process;
	
	rc2: process(count) begin
		if count > 360 then
			km_h <= to_unsigned(0, 8);
		elsif count > 180 then
			km_h <= to_unsigned(10, 8);
		elsif count > 120 then
			km_h <= to_unsigned(20, 8);
		elsif count > 90 then
			km_h <= to_unsigned(30, 8);
		elsif count > 72 then
			km_h <= to_unsigned(40, 8);
		elsif count > 60 then
			km_h <= to_unsigned(50, 8);
		elsif count > 51 then
			km_h <= to_unsigned(60, 8);
		elsif count > 45 then
			km_h <= to_unsigned(70, 8);
		elsif count > 40 then
			km_h <= to_unsigned(80, 8);
		elsif count > 36 then
			km_h <= to_unsigned(90, 8);
		else
			km_h <= to_unsigned(100, 8);
		end if;
	end process;
	
	reg2: process(clk, res) begin
		if res = '1' then
			km_h_reg <= (others =>'0');
		elsif rising_edge(clk) then
			if en_km_h = '1' then
				km_h_reg <= km_h;
			end if;
		end if;
	end process;
	
	rc3: is_over <= '0' when km_h_reg < 60 else '1';
	
	rc4: ncount_over <= count_over+1;
	reg3: process(clk, res) begin
		if res = '1' then
			count_over <= (others => '0');
		elsif rising_edge(clk) then
			if is_over = '1' and en_over='1' then
				count_over <= ncount_over;
			end if;
		end if;
	end process;
	
	reg4: process(clk, res) begin
		if res = '1' then
			state <= idle;
		elsif rising_edge(clk) then
			state <= nstate;
		end if;
	end process;
	
	fsm: process(state, cl1, cl2) begin
		en_num_v <= '0';
		en_count <= '0';
		res_count <= '0';
		en_km_h <= '0';
		en_over <= '0';
		case state is
			when idle=>
				if cl1 = '1' then
					nstate <= start;
				else
					nstate <= idle;
				end if;
			when start=>
				res_count <= '1';
				en_num_v <= '1';
				nstate <= counting;
			when counting=>
				en_count <= '1';
				if cl2 = '1' then
					nstate <= stop;
				else
					nstate <= counting;
				end if;
			when stop=>
				en_km_h <= '1';
				nstate <= over_count;
			when over_count =>
				en_over <= '1';
				nstate <= idle;
			when others=>
				nstate <= idle;
		end case;
	end process;
	
	buf0: num_v <= std_logic_vector(num_v_reg);
	buf1: v <= std_logic_vector(km_h_reg);
	buf2: num_v_oltre <= std_logic_vector(count_over);
end rtl;
































