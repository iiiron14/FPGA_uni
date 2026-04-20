library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MOUSE is
	port( clk 		 : in std_logic;
			res 		 : in std_logic;
			serial_rx : in std_logic;
			x         : out std_logic_vector(3 downto 0);
			y 			 : out std_logic_vector(3 downto 0);
			led 		 : out std_logic_vector(15 downto 0)
	);
end MOUSE;

architecture structural of MOUSE is
signal sample : std_logic;
signal ready  : std_logic;
signal dato   : std_logic_vector(3 downto 0);
signal xx	  : std_logic_vector(3 downto 0);
signal yy	  : std_logic_vector(3 downto 0);
signal nx 	  : std_logic_vector(3 downto 0);
signal ny	  : std_logic_vector(3 downto 0);
begin
	comb_inst: entity work.comb
		port map(xx=>xx, yy=>yy, nx=>nx, ny=>ny, dato=>dato, x=>x, y=>y, led=>led);
	
	serial_inst: entity work.serial_rx
		port map(clk=>clk, res=>res, serial=>serial_rx, sample=>sample, dato=>dato);
	
	watch_dog_inst: entity work.watch_dog
		port map(clk=>clk, res=>res, serial=>serial_rx, sample=>sample, ready=>ready);
	
	reg_inst1: entity work.reg
		port map(clk=>clk, res=>res, x=>xx, nx=>nx, ready=>ready);
	
	reg_inst2: entity work.reg
		port map(clk=>clk, res=>res, x=>yy, nx=>ny, ready=>ready);

end structural;