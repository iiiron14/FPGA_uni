library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity LED_RIEMPI_COLONNA is
	port(
		clk : in std_logic;
		res : in std_logic;
		btn : in std_logic;
		
		phi : out std_logic_vector(2 downto 0);
		col1 : out std_logic_vector(1 downto 0);
		col2 : out std_logic_vector(1 downto 0);
		col3 : out std_logic_vector(1 downto 0);
		
		led : out std_logic_vector(8 downto 0);
		N : out std_logic_vector(15 downto 0)
	);
end LED_RIEMPI_COLONNA;

architecture rtl of LED_RIEMPI_COLONNA is
	signal phi_v : std_logic_vector(2 downto 0);
	signal led_rc : std_logic_vector(8 downto 0);
	signal led_reg, nled_reg : std_logic_vector(8 downto 0);
	signal col1_rc, col2_rc, col3_rc : unsigned(1 downto 0);
	signal col1_reg, col2_reg, col3_reg : unsigned(1 downto 0);
	
	signal res_led : std_logic;
	signal nN, N_reg : unsigned(15 downto 0);
	
	type state_type is (phi_0, phi_1, phi_2);
	signal state, nstate : state_type;
begin
	fsm: process(state) begin
		phi_v(0) <= '0';
		phi_v(1) <= '0';
		phi_v(2) <= '0';
		case state is
			when phi_0=>
				phi_v(0) <= '1';
				nstate <= phi_1;
			when phi_1=>
				phi_v(1) <= '1';
				nstate <= phi_2;
			when phi_2=>
				phi_v(2) <= '1';
				nstate <= phi_0;
			when others=>
				nstate <= phi_0;
		end case;
	end process;
	
	reg_fsm: process(clk, res) begin
		if res = '1' then
			state <= phi_0;
		elsif rising_edge(clk) then
			state <= nstate;
		end if;
	end process;
	
	rc0: process(phi_v, btn, led_reg) begin
		led_rc <= (others => '0');
		if btn='1' and phi_v(0)='1' then
			if led_reg(6) = '0' then
				led_rc(6) <= '1';
			elsif led_reg(3) = '0' then
				led_rc(3) <= '1';
			elsif led_reg(0) = '0' then
				led_rc(0) <= '1';
			end if;
		elsif btn='1' and phi_v(1)='1' then
			if led_reg(7) = '0' then
				led_rc(7) <= '1';
			elsif led_reg(4) = '0' then
				led_rc(4) <= '1';
			elsif led_reg(1) = '0' then
				led_rc(1) <= '1';
			end if;
		elsif btn = '1' and phi_v(2) = '1' then
			if led_reg(8)='0' then
				led_rc(8) <= '1';
			elsif led_reg(5) = '0' then
				led_rc(5) <= '1';
			elsif led_reg(2) = '0' then
				led_rc(2) <= '1';
			end if;
		end if;
	end process;
	
	rc1: process(led_reg)
		type arr_type is array (0 to 2) of unsigned(1 downto 0);
		variable count_col : arr_type;
	begin
		count_col := (others=>(others=>'0'));
		for col in 0 to 2 loop
			for row in 0 to 2 loop
				if led_reg(col + row*3) = '1' then
					count_col(col) := count_col(col) + 1;
				end if;
			end loop;
		end loop;
		col1_rc <= count_col(0);
		col2_rc <= count_col(1);
		col3_rc <= count_col(2);
	end process;
	
	reg1: process(clk, res, res_led) begin
		if res='1' or res_led='1' then
			led_reg <= (others=>'0');
		elsif rising_edge(clk) then
			if btn='1' then
				led_reg <= nled_reg;
			end if;
		end if;
	end process;
	
	reg2: process(clk, res) begin
		if res = '1' then
			col1_reg <= (others=>'0');
			col2_reg <= (others=>'0');
			col3_reg <= (others=>'0');
		elsif rising_edge(clk) then
			col1_reg <= col1_rc;
			col2_reg <= col2_rc;
			col3_reg <= col3_rc;
		end if;
	end process;
	
	rc2: process(col1_reg, col2_reg, col3_reg) begin
		res_led <= '0';
		if col1_reg = to_unsigned(3,2) and col2_reg = to_unsigned(3,2) then
			res_led <= '1';
		elsif col1_reg = to_unsigned(3,2) and col3_reg = to_unsigned(3,2) then
			res_led <= '1';
		elsif col2_reg = to_unsigned(3,2) and col3_reg = to_unsigned(3,2) then
			res_led <= '1';
		end if;
	end process;
	
	rc4: nled_reg <= led_rc or led_reg;
	rc3: nN <= N_reg +1;
	reg3: process(clk, res, res_led) begin
		if res = '1' or res_led = '1' then
			N_reg <= (others=>'0');
		elsif rising_edge(clk) then
			if btn='1' then
				N_reg <= nN;
			end if;
		end if;
	end process;
	
	led <= led_reg;
	col1 <= std_logic_vector(col1_reg);
	col2 <= std_logic_vector(col2_reg);
	col3 <= std_logic_vector(col3_reg);
	N <= std_logic_vector(N_reg);
	phi(0) <= phi_v(0);
	phi(1) <= phi_v(1);
	phi(2) <= phi_v(2);
end;


































