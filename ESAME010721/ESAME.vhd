library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ESAME is
	port(
		clk : in std_logic;
		res : in std_logic;
		rx : in std_logic;
		
		led_unico : out std_logic_vector(14 downto 0);
		num_adiacenti : out std_logic_vector(3 downto 0); -- uns
		led_adiacenti : out std_logic_vector(14 downto 0);
		div4 : out std_logic_vector(7 downto 0) -- uns
		
	);
end ESAME;

architecture rtl of esame is
	-- Internal signals
	signal data_rx, n, n_reg : unsigned(3 downto 0);
	signal count, ncount, count_reg : unsigned(1 downto 0);
	
	signal led_unico_reg, led_unico_rc : unsigned(14 downto 0);
	
	signal num_adiacenti_rc, num_adiacenti_reg : unsigned(3 downto 0);
	signal adiacenti : std_logic;
	
	signal led_adiacenti_rc, led_adiacenti_reg : unsigned(14 downto 0);
	
	signal div4_reg, div4_rc : unsigned(7 downto 0);
	signal div4_true : std_logic;
	
	signal res_adiacenti_a : std_logic;
	signal res_led_ad : std_logic;
	signal res_led_ad_a : std_logic;
	signal res_ad : std_logic;
	
	-- Enables
	signal en_fifo : std_logic;
	signal start_count : std_logic;
	signal en_n_reg : std_logic;
	signal en_adiacenti : std_logic;
	signal en_div4 : std_logic;
	signal en_led_ad : std_logic;
	
	-- FSM
	type state_type is (idle, start, s1, s2, s3, stop, en1, ad_on, ad_off);
	signal state, nstate : state_type;
	
begin
	-- to check ------------------------------------------------------
	fifo: process(clk, res) begin
		if res='1' then
			data_rx(3 downto 0) <= (others => '0');
		elsif rising_edge(clk) then
			if en_fifo = '1' then
				data_rx(3) <= rx;
				data_rx(2 downto 0) <= data_rx(3 downto 1);
			end if;
		end if;
	end process;
	
	-- to check -----------------------------------------------------
	reg_N: process(clk, res) begin
		if res = '1' then
			n <= to_unsigned(0, 4);
		elsif rising_edge(clk) then
			if en_fifo = '1' then
				n <= data_rx;
			end if;
		end if;
	end process;
	
	rc_count: ncount <= count+1;
	reg_count: process(clk, res) begin
		if res='1' then
			count <= to_unsigned(0, 2);
		elsif rising_edge(clk) then
			if start_count = '1' then
				count <= ncount;
			end if;
		end if;
	end process;
	
	-- no enable?
	reg_count_reg: process(clk, res) begin
		if res='1' then
			count_reg <= to_unsigned(0, 2);
		elsif rising_edge(clk) then
			count_reg <= count;
		end if;
	end process;
	
	reg_n_reg: process(clk, res) begin
		if res='1' then
			n_reg <= to_unsigned(0, 4);
		elsif rising_edge(clk) then
			if en_n_reg = '1' then
				n_reg <= n;
			end if;
		end if;
	end process;
	
	reg_led_unico_reg: process(clk, res) begin
		if res = '1' then
			led_unico_reg <= to_unsigned(0, 15);
		elsif rising_edge(clk) then
			led_unico_reg <= led_unico_rc;
		end if;
	end process;
	
	rc_led_unico_rc: process(N)
		variable led_on : unsigned(14 downto 0);
	begin
		led_unico_rc <= to_unsigned(0, 15);
		for I in 1 to 15 loop
			if I = N then
				led_unico_rc <= led_on;
			else
				led_on(14 downto 0) := led_on(14 downto 1) & '0';
			end if;
		end loop;
	end process;
	
	res_adiacenti_a <= res or res_ad;
	num_adiacenti_rc <= num_adiacenti_reg + 1;
	reg_num_adiacenti_reg: process(clk, res_adiacenti_a) begin
		if res_adiacenti_a = '1' then
			num_adiacenti_reg <= to_unsigned(0, 4);
		elsif rising_edge(clk) then
			if en_adiacenti = '1' then
				num_adiacenti_reg <= num_adiacenti_rc;
			end if;
		end if;
	end process;
	
	rc_adiacenti: process(n, n_reg)
		variable diff : signed(4 downto 0);
	begin
		if n = n_reg then
			adiacenti <= '1';
		elsif n = (n_reg+1) then
			adiacenti <= '1';
		elsif n = (n_reg-1) then
			adiacenti <= '1';
		else
			adiacenti <= '0';
		end if;
	end process;
	
	res_led_ad_a <= res or res_led_ad;
	reg_led_adiacenti_reg: process(clk, res_led_ad_a) begin
		if res_led_ad_a = '1' then
			led_adiacenti_reg <= to_unsigned(0, 15);
		elsif rising_edge(clk) then
			if en_led_ad = '1' then
				led_adiacenti_reg <= led_adiacenti_rc;
			end if;
		end if;
	end process;
	
	rc_led_ad: process(led_unico_rc) begin
		if adiacenti = '1' then
			led_adiacenti_rc <= led_unico_rc;
		else
			led_adiacenti_rc <= to_unsigned(0, 15);
		end if;
	end process;
	
	div4_rc <= div4_reg + 1;
	reg_div4: process(clk, res) begin
		if res = '1' then
			div4_reg <= to_unsigned(0, 8);
		elsif rising_edge(clk) then
			if en_div4 = '1' then
				div4_reg <= div4_rc;
			end if;
		end if;
	end process;
	
	rc_div4: process(N)
	begin
		if N(1 downto 0) = to_unsigned(0, 2) then
			div4_true <= '1';
		else
			div4_true <= '0';
		end if;
	end process;
	
	-- ---------------------------------------------------- FSM ---------------------------------------------------------------------
	reg_fsm: process(clk, res) begin
		if res = '1' then
			state <= idle;
		elsif rising_edge(clk) then
			state <= nstate;
		end if;
	end process;
	
	fsm_tree: process(state, rx, adiacenti) begin
		-- Default signal values
		en_fifo <= '0';
		start_count <= '0';
		en_n_reg <= '0';
		en_adiacenti <= '0';
		en_div4 <= '0';
		en_led_ad <= '0';
		res_ad <= '0';
		res_led_ad <= '0';
		
		case state is
			when idle =>
				if rx = '0' then
					nstate <= start;
				else
					nstate <= idle;
				end if;
			when start =>
				start_count <= '1';
				en_fifo <= '1';
				nstate <= s1;
			when s1 =>
				start_count <= '1';
				en_fifo <= '1';
				nstate <= s2;
			when s2 =>
				start_count <= '1';
				en_fifo <= '1';
				nstate <= s3;
			when s3 =>
				start_count <= '1';
				en_fifo <= '1';
				nstate <= stop;
			when stop =>
				nstate <= en1;
			when en1 =>
				en_n_reg <= '1';
				en_div4 <= '1';
				if adiacenti = '1' then
					nstate <= ad_on;
				else
					nstate <= ad_off;
				end if;
			when ad_on =>
				en_adiacenti <= '1';
				en_led_ad <= '1';
				nstate <= idle;
			when ad_off =>
				res_ad <= '1';
				res_led_ad <= '1';
				nstate <= idle;
			when others =>
				nstate <= idle;
		end case;
	end process;
	
	led_unico <= std_logic_vector(led_unico_reg);
	num_adiacenti <= std_logic_vector(num_adiacenti_reg);
	led_adiacenti <= std_logic_vector(led_adiacenti_reg);
	div4 <= std_logic_vector(div4_reg);
end rtl;
































