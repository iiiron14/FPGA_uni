library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity COMB is
	port( xx   : in  std_logic_vector(3 downto 0);
			yy   : in  std_logic_vector(3 downto 0);
			dato : in  std_logic_vector(3 downto 0);
			x    : out std_logic_vector(3 downto 0);
			y    : out std_logic_vector(3 downto 0);
			nx   : out std_logic_vector(3 downto 0);
			ny   : out std_logic_vector(3 downto 0);
			led  : out std_logic_vector(15 downto 0)
	);
end COMB;

architecture rtl of COMB is
signal dy : signed(1 downto 0);
signal dx : signed(1 downto 0);
begin
	-- Aggiornamento del valore rispetto al movimento
	rc0: nx <= std_logic_vector(signed(xx) + resize(dx, 4));
	rc1: ny <= std_logic_vector(signed(yy) + resize(dy, 4));
	
	-- Spostamenti dal vettore seriale
	rc3: dy <= signed(dato(3 downto 2));
	rc4: dx <= signed(dato(1 downto 0));
	
	-- Calcolo della posizione e accensione led
	rc5: process(xx, yy)
		variable xint, yint : natural range 0 to 3;
		variable position   : natural range 0 to 15;
		
		begin
		led <= (others => '0');
		xint := to_integer(unsigned(xx));
		yint := to_integer(unsigned(yy));
		position := yint*4 + xint; -- poichè il vettore è ordinato per righe e.g. y=1 --> led[4] % led[7]
		led(position) <= '1';
	end process;
	
	bufx: x <= xx;
	bufy: y <= yy;
end rtl;