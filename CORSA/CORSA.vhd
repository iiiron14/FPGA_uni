library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CORSA is
	port(
		clk : in std_logic;
		res : in std_logic;
		start : in std_logic;
		joy1_l : in std_logic;
		joy1_r : in std_logic;
		joy2_l : in std_logic;
		joy2_r : in std_logic;
		
		punti1 : out std_logic_vector(3 downto 0);
		punti2 : out std_logic_vector(3 downto 0);
		distanza1 : out std_logic_vector(6 downto 0);
		distanza2 : out std_logic_vector(6 downto 0);
		countdown : out std_logic_vector(1 downto 0)
	);
end CORSA;

architecture structural of CORSA is
	signal false_start_out1, false_start_out2 : std_logic;
	signal win1, win2 : std_logic;
	signal lost1, lost2 : std_logic;
begin
	player1: entity work.FSM_TOP
		port map (clk=>clk, res=>res, start=>start, joy_l=>joy1_l, joy_r=>joy1_r, false_start_in=>false_start_out2, win_other=>win2,
			win=>win1, lost=>lost1, false_start_out=>false_start_out1, std_logic_vector(distanza_out)=>distanza1,
			std_logic_vector(countdown)=>countdown, std_logic_vector(punti_out)=>punti1);
		
	player2: entity work.FSM_TOP
		port map(clk=>clk, res=>res, start=>start, joy_l=>joy2_l, joy_r=>joy2_r, false_start_in=>false_start_out1, win_other=>win1,
			win=>win2, lost=>lost2, false_start_out=>false_start_out2, std_logic_vector(distanza_out)=>distanza2,
			std_logic_vector(countdown)=>open, std_logic_vector(punti_out)=>punti2);
end structural;


-- ISTRUZIONI PER LA VERIFICA:
-- 1 - CAMBIARE sec_elapsed in FSM_COUNTDOWN AVERE MENO CICLI DI CLOCK PER 1 SECONDO
-- 2 - CAMBIARE distanza=100 IN FSM_TOP PER AUMENTARE I PUNTI A MENO DI 100 ESECUZIONI DEL CICLO