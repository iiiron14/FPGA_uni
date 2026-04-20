library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FSM_COUNTDOWN is
	port(
		clk : in std_logic;
		res : in std_logic;
		start : in std_logic;
		en_countdown : in std_logic;
		joy : in std_logic;
		
		countdown : out unsigned(1 downto 0);
		start_run : out std_logic;
		false_start_out : out std_logic
	);
end FSM_COUNTDOWN;

architecture rtl of FSM_COUNTDOWN is
	type state_countdown_type is (idle_countdown, s3, s2, s1, run);
	signal state, nstate : state_countdown_type;
	
	signal count, ncount : unsigned(19 downto 0);
	signal sec_elapsed : std_logic;
	
	signal res_countdown, res_count : std_logic;
	
begin
	fsm: process(state, joy, sec_elapsed, start) begin
		false_start_out <= '0';
		start_run <= '0';
		res_count <= '0';
		
		case state is
			when idle_countdown =>
				countdown <= to_unsigned(3,2);
				if en_countdown = '1' then
					nstate <= s3;
					res_count <= '1';
				else 
					nstate <= idle_countdown;
				end if;
			when s3 =>
				countdown <= to_unsigned(3,2);
				if joy = '1' then
					false_start_out <= '1';
					nstate <= idle_countdown;
				elsif sec_elapsed = '1' then
					nstate <= s2;
					res_count <= '1';
				else
					nstate <= s3;
				end if;
			when s2 =>
				countdown <= to_unsigned(2,2);
				if joy = '1' then
					false_start_out <= '1';
					nstate <= idle_countdown;
				elsif sec_elapsed = '1' then
					nstate <= s1;
					res_count <= '1';
				else
					nstate <= s2;
				end if;
			when s1 =>
				countdown <= to_unsigned(1,2);
				if joy = '1' then
					false_start_out <= '1';
					nstate <= idle_countdown;
				elsif sec_elapsed = '1' then
					nstate <= run;
				else
					nstate <= s1;
				end if;
			when run =>
				countdown <= to_unsigned(0,2);
				start_run <= '1';
				nstate <= idle_countdown;
			when others =>
				countdown <= to_unsigned(3,2);
				nstate <= idle_countdown;
		end case;
	end process;
	
	
	res_countdown <= res or start;
	reg_countdown: process(clk, res_countdown) begin
		if res = '1' then
			state <= idle_countdown;
		elsif rising_edge(clk) then
			if en_countdown =  '1' then
				state <= nstate;
			end if;
		end if;
	end process;
	
	
	ncount <= count + 1;
	reg_count: process(clk) begin
		if res='1' then
			count <= to_unsigned(0, 20);
		elsif rising_edge(clk) then
			if start = '1' or res_count = '1' then
				count <= to_unsigned(0, 20);
			elsif en_countdown = '1' then
				count <= ncount;
			end if;
		end if;
	end process;
	
	sec_elapsed <= '1' when count = 3 else '0';
end rtl;