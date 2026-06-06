library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PONG is
	port(
		clk : in std_logic;
		res : in std_logic;
		
		l1 : in std_logic;
		r1 : in std_logic;
		
		l2 : in std_logic;
		r2 : in std_logic;
		
		x : out std_logic_vector(3 downto 0);
		y : out std_logic_vector(3 downto 0);
		x1 : out std_logic_vector(3 downto 0);
		x2 : out std_logic_vector(3 downto 0);
		p1 : out std_logic_vector(3 downto 0);
		p2 : out std_logic_vector(3 downto 0)
	);
end PONG;

architecture structural of PONG is
	-- FSM signals
	signal posx, posy, pos1, pos2 : unsigned(3 downto 0);
	signal en_p1, en_p2, new_point : std_logic;
	signal points1, points2 : unsigned(3 downto 0);
begin

	fsm_inst: entity work.FSM 
		port map (clk=>clk, res=>res, posx=>posx, posy=>posy, en_p1=>en_p1, en_p2=>en_p2, new_point=>new_point);
	ball_inst: entity work.BALL
		port map (clk=>clk, res=>res, x=>posx, y=>posy, pos1=>pos1, pos2=>pos2, new_point=>new_point);
	player1_inst: entity work.PLAYER
		port map (clk=>clk, res=>res, l=>l1, r=>r1, y=>posy, new_point=>new_point, position=>pos1);
	player2_inst: entity work.PLAYER
		port map (clk=>clk, res=>res, l=>l2, r=>r2, y=>posy, new_point=>new_point, position=>pos2);
	points_inst: entity work.POINTS
		port map (clk=>clk, res=>res, en_p1=>en_p1, en_p2=>en_p2, points1=>points1, points2=>points2);
	
	p1 <= std_logic_vector(points1);
	p2 <= std_logic_vector(points2);
	x <= std_logic_vector(posx);
	y <= std_logic_vector(posy);
	x1 <= std_logic_vector(pos1);
	x2 <= std_logic_vector(pos2);
end structural;