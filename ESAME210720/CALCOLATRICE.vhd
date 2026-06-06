library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CALCOLATRICE is
	port(
		clk : in std_logic;
		res : in std_logic;
		stream : in std_logic;
		
		result : out std_logic_vector(7 downto 0);
		result_u : out std_logic_vector(3 downto 0);
		result_d : out std_logic_vector(3 downto 0);
		result_c : out std_logic_vector(3 downto 0);
	);
end CALCOLATRICE;

architecture rtl of CALCOLATRICE is
	signal count, ncount : unsigned(3 downto 0);
	signal op1, op2 : unsigned(3 downto 0);
	signal operation : unsigned(3 downto 0);
	signal en_res, en_store_operand, en_store_operation : std_logic;
	
	type state_type is (w0, w1, w2, w3, w4, w5, op1_u, op1_d, op2_u, op2_d, store_op, op_state, result_state);
	signal state, nstate : state_type;
begin
	reg_fsm: process(clk, res) begin
		if res = '1' then
			state <= w0;
		elsif rising_edge(clk) then
			state <= nstate;
		end if;
	end process;
	
	rc0: ncount <= count +1;
	reg0: process(clk, res) begin
		if res = '1' or res_count = '1' then
			count <= (others=>'0');
		elsif rising_edge(clk) then
			if stream = '1' then
				count <= ncount;
			end if;
		end if;
	end process;
	
	fsm: process(state, stream, count) begin
		nstate <= state;
		en_op1 <= '0';
		res_count <= '0';
		en_times_ten <= '0';
		en_store_operation <= '0';
		case state is
			when w0=>
				if stream = '0' then
					nstate <= op1_u;
				end if;
			when op1_u=>
				en_op1 <= '1';
				res_count <= '1';
				nstate <= w1;
			when w1 =>
				if stream = '0' and count <= to_unsigned(10, 4) then
					nstate <= op1_d;
				elsif stream = '0' then
					nstate <= store_op;
				end if;
			when op1_d=>
				en_op1 <= '1';
				en_times_ten <= '1';
				res_count <= '1';
				nstate <= w2;
			when w2=>
				if stream='0' then
					nstate <= store_op;
				end if;
			when store_op=>
				res_count <= '1';
				en_store_operation <= '1';
				nstate <= w3;
			when w3=>
				if stream = '0' then
					nstate <= op2_u;
				end if;
			when op2_u=>
				res_count <= '1';
				en_op2 <= '1';
				nstate <= w4;
			when w4 =>
				if stream = '0' and count <= to_unsigned(10, 4)then
					nstate <= op2_d;
				elsif stream = '0' then
					nstate <= op_state;
				end if;
			when op2_d =>
				res_count <= '1';
				en_op2 <= '1';
				en_times_ten <= '1';
				nstate <= ;
			when op_state =>
				if operation = to_unsigned(11, 4) then
					en_sum <= '1';
				else
					en_sub <= '1';
				end if;
				nstate <= w5;
			when w5 =>
				if stream = '0' then
					nstate <= result_state;
				end if;
			when result_state =>
				res_count <= '1';
				en_result <= '1';
				nstate <= w0;
			when others=>
				nstate <= w0;
		end case;

end rtl;






























