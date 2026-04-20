library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity DE10_LITE is
    port (
-- CLOMAX10_CLK1_50 
          MAX10_CLK1_50: in STD_LOGIC;

-- SEG7
          HEX0         : out STD_LOGIC_VECTOR (7 downto 0);
          HEX1         : out STD_LOGIC_VECTOR (7 downto 0);
--        HEX2         : out STD_LOGIC_VECTOR (7 downto 0);
--        HEX3         : out STD_LOGIC_VECTOR (7 downto 0);

-- KEY
          KEY          : in STD_LOGIC_VECTOR (1 downto 0)
    );
end DE10_LITE;


architecture A of DE10_LITE is

	signal ss: unsigned(5 downto 0);
	signal n_ss: unsigned(5 downto 0);
	signal tick: std_logic;
	signal N: unsigned(25 downto 0); 
	signal nN: unsigned(25 downto 0); 
	signal unts:unsigned(3 downto 0);
	signal decs: unsigned(3 downto 0);
	
	component DEC7SEG is
	port(
		  DIGIT : in unsigned(3 downto 0);
		  LED: out std_logic_vector(7 downto 0)
		  );
	end component DEC7SEG ;
	
	component unsigned2digits is
	port(
		  n : in unsigned(5 downto 0);
        u : out unsigned(3 downto 0);
        d : out unsigned(3 downto 0) 
		  );
   end component unsigned2digits ;
	
begin

	reg0: process(MAX10_CLK1_50, KEY(0))
		begin
			if KEY(0)='0' then
				ss<=to_unsigned(0,6);
			elsif MAX10_CLK1_50'event and MAX10_CLK1_50='1' then
				if tick='1' then
					ss<= n_ss;
				end if;
			end if;
		end process;
			
	reg1: process(MAX10_CLK1_50, KEY(0))
		begin
			if KEY(0)='0' then
				N<=to_unsigned(0,26);
			elsif MAX10_CLK1_50'event and MAX10_CLK1_50='1' then
				N<= nN;
			end if;
		end process;
		
	tick_count: process(N)
		begin
			if N=to_unsigned(50_000_000-1, 26) then
				tick <= '1';
			else
				tick<='0';
			end if;
		end process;
		
	inc0: nN<=to_unsigned(0,26) when N=50_000_000-1 else N+1;
	
	inc1: n_ss<=ss+1 when ss<59 else to_unsigned(0, 6);
	
	bcd0:  unsigned2digits port map(n => ss, u => unts, d => decs);
	
	disp_sec_u: DEC7SEG port map(digit => unts, led => HEX0);
	disp_sec_d: DEC7SEG port map(digit => decs, led => HEX1);
	

end A;