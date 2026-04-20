library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity orologio is
	generic( f_ck : integer );
	port(clk : in std_logic;
		  res : in std_logic;
		  hh  : inout unsigned(5 downto 0);
		  mm  : inout unsigned(5 downto 0);
		  ss  : inout unsigned(5 downto 0)
		  );
end orologio;

architecture rtl of orologio is
signal tick   : std_logic;
signal count  : unsigned(14 downto 0);
signal ncount : unsigned(14 downto 0);
signal nss    : unsigned(5 downto 0);
signal nmm    : unsigned(5 downto 0);
signal nhh    : unsigned(5 downto 0);
begin
	rc0: tick <= '1' when count=f_ck-1 else '0';
	rc1: ncount <= to_unsigned(0,15) when count=f_ck-1 else count+1;
	rc2: nss <= to_unsigned(0,6) when ss=59 else ss+1;
	rc3: nmm <= to_unsigned(0,6) when mm=59 else mm+1;
	rc4: nhh <= to_unsigned(0,6) when hh=23 else hh+1;
	
	reg1: process(clk, res) begin
		if res='1' then count<=to_unsigned(0,15);
		elsif rising_edge(clk) then count<=ncount;
		end if;
	end process;
	
	reg2: process(clk, res) begin
		if res='1' then ss<=to_unsigned(0,6);
		elsif tick='1' then
			if rising_edge(clk) then ss<=nss;
			end if;
		end if;
	end process;
	
	reg3: process(clk, res) begin
		if res='1' then mm<=to_unsigned(0,6);
		elsif tick='1' and ss=59 then
			if rising_edge(clk) then mm<=nmm;
			end if;
		end if;
	end process;
	
	reg4: process(clk, res) begin
		if res='1' then hh<=to_unsigned(0,6);
		elsif ss=59 and mm=59 and tick='1' then
			if rising_edge(clk) then hh<=nhh;
			end if;
		end if;
	end process;
	
	
	
end rtl;