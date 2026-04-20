library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity WAVE_OUT_WRITE is
	port(
		clk : in std_logic;
		res : in std_logic;
		en_wave_gen : in std_logic;
		en_wave_out : in  std_logic;
		wave_slv : in std_logic_vector(7 downto 0);
		
		wave : out std_logic
	);
end WAVE_OUT_WRITE;

architecture rtl of WAVE_OUT_WRITE is
    signal q_regs : std_logic_vector(7 downto 0);
begin
    usr: process(clk, res) begin
        if res = '1' then
            q_regs <= (others => '0');
        elsif rising_edge(clk) then
            if en_wave_gen = '1' then
                q_regs <= wave_slv;
            elsif en_wave_out = '1' then
                q_regs <= '0' & q_regs(7 downto 1);
            end if;
        end if;
    end process;
	 
    wave <= q_regs(0);
end rtl;