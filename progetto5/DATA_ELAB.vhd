library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DATA_ELAB is
	port(
		clk : in std_logic;
		res : in std_logic;
		start : in std_logic;
		sensordata : in std_logic_vector(11 downto 0);
		busy : out std_logic;
		sig1 : out std_logic;
		phi1 : out std_logic;
		phi2 : out std_logic;
		sig2 : out std_logic;
		average : out std_logic_vector(11 downto 0)
	);
end DATA_ELAB;

architecture structural of DATA_ELAB is
	signal count_end : std_logic; 
	signal read_en : std_logic;
	signal count_en : std_logic;
	signal mean_en : std_logic;
	signal sensordata_sum_out : unsigned(15 downto 0);
	signal sensordata_sum_in : unsigned(15 downto 0);
	
	attribute syn_keep : boolean;
	attribute syn_keep of count_end : signal is true;
	attribute syn_keep of read_en : signal is true;
	attribute syn_keep of mean_en : signal is true;
	attribute syn_keep of sensordata_sum_out : signal is true;
	attribute syn_keep of sensordata_sum_in : signal is true;
	
begin
	fsm: entity work.FSM
		port map(clk=>clk, res=>res, start=>start, phi1=>phi1, phi2=>phi2, sig1=>sig1, sig2=>sig2, busy=>busy, read_en=>read_en, count_en=>count_en,
				    mean_en=>mean_en, count_end=>count_end);
	counter: entity work.COUNTER
		port map(clk=>clk, res=>res, start=>start, count_en=>count_en, count_end=>count_end);
	summer: entity work.SUMMER
		port map(clk=>clk, res=>res, start=>start, sensordata=>unsigned(sensordata), sensordata_sum_out=>sensordata_sum_out, sensordata_sum_in=>sensordata_sum_in, read_en=>read_en);
	avg: entity work.AVG
		port map(clk=>clk, res=>res, mean_en=>mean_en, sensordata_sum=>sensordata_sum_out, std_logic_vector(average)=>average);
	sensordata_sum_in <= sensordata_sum_out;
end structural;