library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity OROLOGIO is
    port (
-- CLOCK 
--        ADC_CLK_10   : in STD_LOGIC;
--        MAX10_CLK1_50: in STD_LOGIC;
        MAX10_CLK2_50: in STD_LOGIC;

-- SDRAM
--        DRAM_ADDR    : out STD_LOGIC_VECTOR (12 downto 0);
--        DRAM_BA      : out STD_LOGIC_VECTOR (1 downto 0);
--        DRAM_CAS_N   : out STD_LOGIC;
--        DRAM_CKE     : out STD_LOGIC;
--        DRAM_CLK     : out STD_LOGIC;
--        DRAM_CS_N    : out STD_LOGIC;
--        DRAM_DQ      : inout STD_LOGIC_VECTOR (15 downto 0);
--        DRAM_LDQM    : out STD_LOGIC;
--        DRAM_RAS_N   : out STD_LOGIC;
--        DRAM_UDQM    : out STD_LOGIC;
--        DRAM_WE_N    : out STD_LOGIC;

-- SEG7
        HEX0         : out STD_LOGIC_VECTOR (7 downto 0);
        HEX1         : out STD_LOGIC_VECTOR (7 downto 0);
--        HEX2         : out STD_LOGIC_VECTOR (7 downto 0);
--        HEX3         : out STD_LOGIC_VECTOR (7 downto 0);
--        HEX4         : out STD_LOGIC_VECTOR (7 downto 0);
--        HEX5         : out STD_LOGIC_VECTOR (7 downto 0);

-- KEY
        KEY          : in STD_LOGIC_VECTOR (1 downto 0)

-- LED
--        LEDR         : out STD_LOGIC_VECTOR (9 downto 0);

-- SW
--        SW           : in STD_LOGIC_VECTOR (9 downto 0)
		  
-- VGA
--        VGA_B          : out STD_LOGIC_VECTOR (3 downto 0);
--        VGA_G          : out STD_LOGIC_VECTOR (3 downto 0);
--        VGA_HS         : out STD_LOGIC;
--        VGA_R          : out STD_LOGIC_VECTOR (3 downto 0);
--        VGA_VS         : out STD_LOGIC;

-- Accelerometer
--        GSENSOR_CS_N   : out STD_LOGIC;
--        GSENSOR_INT    : in  STD_LOGIC_VECTOR (2 downto 1);
--        GSENSOR_SCLK   : out STD_LOGIC;
--        GSENSOR_SDI    : inout STD_LOGIC;
--        GSENSOR_SDO    : inout STD_LOGIC;

-- Arduino
--        ARDUINO_IO     : inout STD_LOGIC_VECTOR (15 downto 0);
--        ARDUINO_RESET_N: inout STD_LOGIC;

-- GPIO
--      GPIO           : inout std_logic_vector(35 downto 0)
    );
end entity OROLOGIO;


architecture A of OROLOGIO is

-- declare signals, components, etc., here
	signal tick, ntick : unsigned(25 downto 0);
	signal RES: std_logic;
	signal CONT, nCONT: unsigned(5 downto 0);
	signal uCONT, dCONT: unsigned(3 downto 0);
	
	component DEC7SEG is
		port(DIGIT : in unsigned(3 downto 0);
     LED: out std_logic_vector(7 downto 0));
	end component;

	component unsigned2digits is
   port( n : in unsigned(7 downto 0);
         u : out unsigned(3 downto 0);
         d : out unsigned(3 downto 0) );
	end component;

begin


-- insert your logic here

	bufRES: RES <= not(KEY(0));
	
	regTICK: process(MAX10_CLK2_50,  RES)
				begin
					if RES = '1' then
						tick <= to_unsigned(0, 26);
					elsif MAX10_CLK2_50' event and MAX10_CLK2_50 = '1' then
						tick <= ntick;
					end if;
				end process;
				
	rcTICK: process(tick)
			  begin
				 if tick = to_unsigned(50_000_000 - 1, 26) then
					ntick <= to_unsigned(0, 26);
				 else
					ntick <= tick + 1;
				 end if;
			  end process;

	regCONT: process(MAX10_CLK2_50,  RES)
				begin
					if RES = '1' then
						CONT <= to_unsigned(0, 6);
					elsif MAX10_CLK2_50' event and MAX10_CLK2_50 = '1' then
						CONT <= nCONT;
					end if;
				end process;
				
	rcCONT: process(CONT, tick)
				begin
					if tick = to_unsigned(50, 6) then
						if CONT = to_unsigned(59, 6) then
							nCONT <= to_unsigned(0, 6);
						else
							nCONT <= CONT + 1;
						end if;
					else
						nCONT <= CONT;
					end if;
				end process;
				
	decCONT: unsigned2digits port map( n => resize(CONT, 8), u => uCONT, d => dCONT);
	
	disp1: DEC7SEG port map(DIGIT => uCONT, LED => HEX0);
	disp2: DEC7SEG port map(DIGIT => dCONT, LED => HEX1);
	
end A;