library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FSM_TOP is
	port(
		clk : in std_logic;
		res : in std_logic;
		start : in std_logic;
		joy_r : in std_logic;
		joy_l : in std_logic;
		false_start_in : in std_logic;
		win_other : in std_logic;
		
		win : out std_logic;
		lost : out std_logic;
		false_start_out : inout std_logic;
		distanza_out : out unsigned(6 downto 0);
		countdown : out unsigned(1 downto 0);
		punti_out : out unsigned(3 downto 0)
	);
end FSM_TOP;

architecture rtl of FSM_TOP is
	-- RUN INSTANCE
	signal start_run : std_logic; -- FROM COUNTDOWN TO RUN
	signal en_run    : std_logic; -- GENERATA FSM
	
	-- COUNTDOWN INSTANCE
	signal en_countdown : std_logic; -- GENERATA FSM
	attribute syn_keep : boolean;
	attribute syn_keep of en_countdown : signal is true;
	
	-- TOP INSTANCE
	signal en_punti : std_logic; -- GENERATA FSM
	signal npunti   : unsigned(3 downto 0);
	
	type state_top_type is (idle_top, countdown_top, run_top, win_top, lose_top);
	signal state, nstate : state_top_type;
	
	signal distanza : unsigned(6 downto 0); -- Segnali di appoggio, non si può assegnare out->inout dalla top entity
	signal punti    : unsigned(3 downto 0);
begin
	run_inst: entity work.FSM_RUN
		port map (clk=>clk, res=>res, start=>start, start_run=>start_run, en_run=>en_run, joy_l=>joy_l, joy_r=>joy_r, distanza=>distanza);
	
	countdown_inst: entity work.FSM_COUNTDOWN
		port map (clk=>clk, res=>res, start=>start, en_countdown=>en_countdown, joy=>(joy_r or joy_l), countdown=>countdown,
			start_run=>start_run, false_start_out=>false_start_out);
	
	fsm: process(state, start, false_start_out, false_start_in, start_run, win_other, distanza) begin
		en_run <= '0';
		en_countdown <= '0';
		en_punti <= '0';
		win <= '0';
		lost <= '0';
		
		case state is
			when idle_top =>
				if start = '1' then
					nstate <= countdown_top;
				else
					nstate <= idle_top;
				end if;
			when countdown_top =>
				en_countdown <= '1';
				if false_start_out = '1' then
					nstate <= lose_top;
				elsif false_start_in = '1' then
					nstate <= win_top;
				elsif start_run = '1' then
					nstate <= run_top;
				else
					nstate <= countdown_top;
				end if;
			when run_top =>
				en_run <= '1';
				if win_other = '1' then
					nstate <= lose_top;
				elsif distanza=2 then
					nstate <= win_top;
				else
					nstate <= run_top;
				end if;
			when win_top =>
				win <= '1';
				en_punti <= '1';
				nstate <= idle_top;
			when lose_top =>
				lost <= '1';
				nstate <= idle_top;
			when others =>
		end case;
	end process;
	
	reg_top: process(clk, res) begin
		if res = '1' then
			state <= idle_top;
		elsif rising_edge(clk) then
			state <= nstate;
		end if;
	end process;
	
	
	npunti <= punti + 1;
	reg_points: process(clk, res) begin
		if res = '1' then
			punti <= to_unsigned(0, 4);
		elsif rising_edge(clk) then
			if en_punti = '1' then
				punti <= npunti;
			end if;
		end if;
	end process;
	
	distanza_out <= distanza;
	punti_out <= punti;
end rtl;