library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity COUNTER7SEG is
	generic( f_ck : integer := 16 );
	port( clk : in  std_logic;
			res : in  std_logic;
			ss_u_seg : out std_logic_vector(6 downto 0);
			ss_d_seg : out std_logic_vector(6 downto 0);
			mm_u_seg : out std_logic_vector(6 downto 0);
			mm_d_seg : out std_logic_vector(6 downto 0);
			hh_u_seg : out std_logic_vector(6 downto 0);
			hh_d_seg : out std_logic_vector(6 downto 0)
	);
end COUNTER7SEG;

architecture structural of COUNTER7SEG is
signal hh_bcd_u : unsigned(3 downto 0);
signal hh_bcd_d : unsigned(3 downto 0);
signal mm_bcd_u : unsigned(3 downto 0);
signal mm_bcd_d : unsigned(3 downto 0);
signal ss_bcd_u : unsigned(3 downto 0);
signal ss_bcd_d : unsigned(3 downto 0);
signal hh       : unsigned(5 downto 0);
signal mm  		 : unsigned(5 downto 0);
signal ss	    : unsigned(5 downto 0);

type bcd is array (0 to 2) of unsigned(3 downto 0);
signal bcd_u : bcd;
signal bcd_d : bcd;

type dec is array (0 to 2) of unsigned(5 downto 0);
signal dec_signals : dec;

type seg is array (0 to 2) of std_logic_vector(6 downto 0);
signal seg_u : seg;
signal seg_d : seg;

begin
	-- bcd_u <= (ss_bcd_u, mm_bcd_u, hh_bcd_u);
	-- bcd_d <= (ss_bcd_d, mm_bcd_d, hh_bcd_d);
	dec_signals <= (ss, mm, hh);
	
	orologio: entity work.orologio
				 generic map( f_ck=>f_ck )
				 port map( hh=>hh, mm=>mm, ss=>ss, clk=>clk, res=>res );
					
	dec_to_bcd: for i in 0 to 2 generate
						dec_to_bcd_i:entity work.dec_to_bcd
						port map( num=>dec_signals(i), u=>bcd_u(i), d=>bcd_d(i) );
					end generate;
					
	bcd_to_7seg: for i in 0 to 2 generate
						bcd_to_7seg_d_i: entity work.bcd_to_7seg
						port map( num => bcd_d(i), seg=>seg_d(i) );
						bcd_to_7seg_u_i: entity work.bcd_to_7seg
						port map( num => bcd_u(i), seg=> seg_u(i) );
					end generate;
	assign_seg_u: (ss_u_seg, mm_u_seg, hh_u_seg) <= seg_u;
	assign_seg_d: (ss_d_seg, mm_d_seg, hh_d_seg) <= seg_d;
					
end structural;