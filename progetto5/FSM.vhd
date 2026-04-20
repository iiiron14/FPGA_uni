library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FSM is
	port(
		clk : in std_logic;
		res : in std_logic;
		start : in std_logic;
		count_end : in std_logic;
		phi1 : out std_logic;
		phi2 : out std_logic;
		sig1 : out std_logic;
		sig2 : out std_logic;
		read_en : out std_logic;
		count_en : out std_logic;
		mean_en : out std_logic;
		busy : out std_logic
	);
end FSM;

architecture rtl of FSM is
	type state_type is (idle, phi1_sig1, phi1_sig2, phi2_s, data, media);
	signal state, nstate : state_type;

begin
	fsm: process(state, start, count_end) begin
		case state is
			when idle =>
				phi1 <= '0';
				sig1 <= '0';
				sig2 <= '0';
				phi2 <= '0';
				read_en <= '0';
				count_en <= '0';
				mean_en <= '0';
				busy <= '0';
				
				if start = '1' then
					nstate <= phi1_sig1;
				else
					nstate <= idle;
				end if;
			when phi1_sig1 =>
				phi1 <= '1';
				sig1 <= '1';
				sig2 <= '0';
				phi2 <= '0';
				read_en <= '0';
				count_en <= '0';
				mean_en <= '0';
				busy <= '1';
				nstate <= phi1_sig2;
			when phi1_sig2 =>
				phi1 <= '1';
				sig1 <= '0';
				sig2 <= '1';
				phi2 <= '0';
				read_en <= '0';
				count_en <= '0';
				mean_en <= '0';
				busy <= '1';
				nstate <= phi2_s;
			when phi2_s =>
				phi1 <= '0';
				sig1 <= '0';
				sig2 <= '0';
				phi2 <= '1';
				read_en <= '0';
				count_en <= '0';
				mean_en <= '0';
				busy <= '1';
				nstate <= data;
			when data =>
				phi1 <= '0';
				sig1 <= '0';
				sig2 <= '0';
				phi2 <= '0';
				read_en <= '1';
				count_en <= '1';
				mean_en <= '0';
				busy <= '1';
				if count_end = '1' then
					nstate <= media;
				else 
					nstate <= phi1_sig1;
				end if;
			when media =>
				phi1 <= '0';
				sig1 <= '0';
				sig2 <= '0';
				phi2 <= '0';
				read_en <= '0';
				count_en <= '0';
				mean_en <= '1';
				busy <= '1';
				nstate <= idle;
			when others =>
				phi1 <= '0';
				sig1 <= '0';
				sig2 <= '0';
				phi2 <= '0';
				read_en <= '0';
				count_en <= '0';
				mean_en <= '0';
				busy <= '0';
				nstate <= idle;
		end case;
	end process;
	
	reg: process(clk, res) begin
		if res = '1' then
			state <= idle;
		elsif rising_edge(clk) then
			state <= nstate;
		end if;
	end process;
end rtl;