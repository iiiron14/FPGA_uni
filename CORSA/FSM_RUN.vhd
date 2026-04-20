library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FSM_RUN is
	port(
		clk : in std_logic;
		res : in std_logic;
		start : in std_logic;
		start_run : in std_logic;
		en_run : in std_logic;
		joy_r : in std_logic;
		joy_l : in std_logic;
		
		distanza : inout unsigned(6 downto 0)
	);
end FSM_RUN;

architecture rtl of FSM_RUN is
	type state_run_type is (idle_run, l_push, l_up, r_push, r_up);
	signal state, nstate : state_run_type;
	
	signal en_distanza : std_logic;
	signal ndistanza : unsigned(6 downto 0);
	
	signal res_run, res_dist : std_logic;
begin
	fsm: process(state, joy_r, joy_l) begin
		en_distanza <= '0';
		
		case state is
			when idle_run =>
				if joy_l = '1' then
					nstate <= l_push;
				else
					nstate <= idle_run;
				end if;
			when l_push =>
				if joy_r = '1' then
					nstate <= idle_run;
				elsif joy_l = '0' then
					nstate <= l_up;
				else
					nstate <= l_push;
				end if;
			when l_up =>
				if joy_l = '1' then
					nstate <= l_push;
				elsif joy_r = '1' then
					nstate <= r_push;
				else
					nstate <= l_up;
				end if;
			when r_push =>
				if joy_l = '1' then
					nstate <= l_push;
				elsif joy_r = '0' then
					nstate <= r_up;
				else
					nstate <= r_push;
				end if;
			when r_up =>
				en_distanza <= '1';
				nstate <= idle_run;
			when others =>
				nstate <= idle_run;
		end case;
	end process;
	
	res_run <= res or start_run;
	reg_state: process(clk, res_run) begin
		if res_run = '1' then
			state <= idle_run;
		elsif rising_edge(clk) then
			if en_run = '1' then
				state <= nstate;
			end if;
		end if;
	end process;
		
	res_dist <= res or start;
	ndistanza <= distanza + 1;
	reg_dist: process(clk, res_dist) begin
		if res_dist = '1' then
			distanza <= to_unsigned(0, 7);
		elsif rising_edge(clk) then
			if en_distanza = '1' then
				distanza <= ndistanza;
			end if;
		end if;
	end process;
end rtl;