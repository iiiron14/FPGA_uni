library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity DE10_LITE is
    port (
-- CLOCK 
--        ADC_CLK_10   : in STD_LOGIC;
        MAX10_CLK1_50: in STD_LOGIC;
--        MAX10_CLK2_50: in STD_LOGIC;

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
        KEY          : in STD_LOGIC_VECTOR (1 downto 0);

-- LED
        LEDR         : out STD_LOGIC_VECTOR (9 downto 0)

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
end DE10_LITE;

architecture structural of DE10_LITE is
	signal count : unsigned(5 downto 0);
	
	signal u : unsigned(3 downto 0);
	signal d : unsigned(3 downto 0);
begin
	counter: entity work.COUNTER
		port map (clk=>MAX10_CLK1_50, res=>not(KEY(0)), count_out=>count);
	dec_bcd: entity work.decoder_bcd
		port map (n=>resize(count, 8), u=>u, d=>d);
		
	dec7seg0: entity work.decoder_7_seg
		port map (digit=>u, seg=>HEX0(6 downto 0));
		
	dec7seg1: entity work.decoder_7_seg
		port map (digit=>d, seg=>HEX1(6 downto 0));
	HEX0(7) <= '1';
	HEX1(7) <= '1';
	LEDR(9 downto 0) <= (others=> '0');
end structural;