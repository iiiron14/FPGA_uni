library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TRAIETTORIA is
	port(
		clk : in std_logic;
		res : in std_logic;
		
		vx0 : in std_logic_vector(15 downto 0);
		vy0 : in std_logic_vector(15 downto 0);
		
		start : in std_logic;
		
		x : out std_logic_vector(15 downto 0);
		y : out std_logic_vector(15 downto 0);
		xpeak : out std_logic_vector(15 downto 0);
		ypeak : out std_logic_vector(15 downto 0);
		N : out std_logic_vector(15 downto 0)
	);
end TRAIETTORIA;

architecture rtl of TRAIETTORIA is
	signal x_reg, y_reg, x_reg2, y_reg2, nx, ny, xpeak_reg, ypeak_reg : signed(15 downto 0);
	signal en_pos, en_peak : std_logic;
	
	signal vy_reg, vx_reg, nvy : signed(15 downto 0);
	signal nN, N_reg : unsigned(15 downto 0);
	
	type state_type is (idle, shooting, peak, falling);
	signal state, nstate : state_type;
begin
	reg_fsm: process(clk, res) begin
		if res='1' then
			state <= idle;
		elsif rising_edge(clk) then
			state <= nstate;
		end if;
	end process;
	
	fsm: process(state, start, x_reg, y_reg, y_reg2) begin
		en_peak <= '0';
		case state is
			when idle=>
				en_pos <= '0';
				if start='1' then
					nstate <= shooting;
				else
					nstate <= idle;
				end if;
			when shooting=>
				en_pos <= '1';
				if(y_reg2 < y_reg) then
					nstate <= peak;
				else
					nstate <= shooting;
				end if;
			when peak=>
				en_pos <= '1';
				en_peak <= '1';
				nstate <= falling;
			when falling=>
				en_pos <= '1';
				if (x_reg = to_signed(319, 16)) or (y_reg = to_signed(199, 16)) then
					nstate <= idle;
				else
					nstate <= falling;
				end if;
			when others=>
				en_pos <= '0';
				nstate <= idle;
		end case;
	end process;
	
	reg0: process(clk, res, start) begin
		if res='1' or start='1' then
			x_reg <= to_signed(0, 16);
			y_reg <= to_signed(199, 16);
		elsif rising_edge(clk) then
			if en_pos = '1' then
				x_reg <= nx;
				y_reg <= ny;
			end if;
		end if;
	end process;
	
	rc0_0: nx <= x_reg + vx_reg;
	rc0_1: ny <= y_reg + vy_reg;
	
	reg1: process(clk, res, start) begin
		if (res = '1') or (start='1') then
			vy_reg <= signed(vy0);
		elsif rising_edge(clk) then
			if en_pos='1' then
				vy_reg <= nvy;
			end if;
		end if;
	end process;
	
	rc1: nvy <= vy_reg - 1;
	
	reg2: process(clk, res) begin
		if res='1' then
			vx_reg <= to_signed(0, 16);
		elsif rising_edge(clk) then
			if start='1' then
				vx_reg <= signed(vx0);
			end if;
		end if;
	end process;
	
	reg3: process(clk, res) begin
		if res='1' then
			x_reg2 <= to_signed(0, 16);
			y_reg2 <= to_signed(199, 16);
		elsif rising_edge(clk) then
			if en_pos = '1' then
				x_reg2 <= x_reg;
				y_reg2 <= y_reg;
			end if;
		end if;
	end process;
	
	reg5: process(clk, res) begin
		if res='1' then
			xpeak_reg <= to_signed(0, 16);
			ypeak_reg <= to_signed(199, 16);
		elsif rising_edge(clk) then
			if en_peak = '1' then
				xpeak_reg <= x_reg2;
				ypeak_reg <= y_reg2;
			end if;
		end if;
	end process;
	
	rc3: nN <= n_reg + 1;
	reg4: process(clk, res) begin
		if res = '1' then
			n_reg <= to_unsigned(0,16);
		elsif rising_edge(clk) then
			if en_pos = '1' then
				n_reg <= nN;
			end if;
		end if;
	end process;
	
	x <= std_logic_vector(x_reg);
	y <= std_logic_vector(y_reg);
	xpeak <= std_logic_vector(xpeak_reg);
	ypeak <= std_logic_vector(ypeak_reg);
	N <= std_logic_vector(n_reg);
end rtl;































