library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity battlefront_ww2_top is
	port (
		clk, reset   : in std_logic;
		Hsync, Vsync : out std_logic;
		btn          : in std_logic_vector (3 downto 0);
		sw           : in std_logic_vector (3 downto 0);
		vgaRed       : out std_logic_vector(3 downto 0);
		vgaGreen     : out std_logic_vector(3 downto 0);
		vgaBlue      : out std_logic_vector(3 downto 0);
		led          : out std_logic_vector(15 downto 0)
	);
end battlefront_ww2_top;

architecture arch of battlefront_ww2_top is
	type state_type is (rules, newgame, play, over);
	signal state_reg, state_next                       : state_type; 
	signal player_one_lives_reg, player_one_lives_next : integer range 0 to 3 := 3;
	signal player_two_lives_reg, player_two_lives_next : integer range 0 to 3 := 3;
	signal pixel_x, pixel_y                            : std_logic_vector(9 downto 0);
	signal video_on, pixel_tick, clock                 : std_logic;
	signal rgb_reg, rgb_next                           : std_logic_vector(11 downto 0);
	signal graph_rgb, text_rgb                         : std_logic_vector(11 downto 0);
	signal dig0_p1, dig1_p1							   : std_logic_vector(3 downto 0);
	signal dig0_p2, dig1_p2							   : std_logic_vector(3 downto 0);
	signal dp1_inc, dp2_inc, d_clr                     : std_logic;
	signal p1_hit_p2, p2_hit_p1                        : std_logic;
	signal text_on                                     : std_logic_vector(3 downto 0);
	signal gra_still                                   : std_logic;
	signal game_over								   : std_logic;
	----------------------------------------------
	-- INSTANTIATE CLOCK WIZARD COMPONENT
	----------------------------------------------
	component clk_wiz_0
		port (
			clk_in1  : in std_logic;
			reset    : in std_logic;
			locked   : out std_logic;
			clk_out1 : out std_logic
		);
	end component;
	----------------------------------------------
	-- INSTANTIATE VGA SYNC COMPONENT
	----------------------------------------------
	component vga_sync
		port (
			clk      : in std_logic;
			reset    : in std_logic;
			video_on : out std_logic;
			p_tick   : out std_logic;
			Hsync    : out std_logic;
			Vsync    : out std_logic;
			pixel_x  : out std_logic_vector(9 downto 0);
			pixel_y  : out std_logic_vector(9 downto 0)
		);
	end component;
	----------------------------------------------
	-- INSTANTIATE GRAPH COMPONENT
	----------------------------------------------
	component battlefront_ww2
		port (
			clk, reset       : in std_logic;
			pixel_x, pixel_y : in std_logic_vector(9 downto 0);
			btn              : in std_logic_vector(3 downto 0);
			video_on         : in std_logic;
			graph_rgb        : out std_logic_vector(11 downto 0);
			led              : out std_logic_vector(15 downto 0);
			sw 				 : in std_logic_vector(3 downto 0);
			p1_hit_p2_out    : out std_logic;
			p2_hit_p1_out    : out std_logic;
			gra_still        : in std_logic;
			over             : in std_logic
		);
	end component;
	----------------------------------------------
	-- INSTANTIATE TEXT COMPONENT
	----------------------------------------------
	component battlefront_ww2_text
		port (
			clk, reset      : in std_logic;
			pixel_x, pixel_y: in std_logic_vector(9 downto 0);
			text_on         : out std_logic_vector(3 downto 0);
			text_rgb        : out std_logic_vector(11 downto 0);
			dig0_p1         : in std_logic_vector(3 downto 0);
			dig1_p1         : in std_logic_vector(3 downto 0);
			dig0_p2         : in std_logic_vector(3 downto 0);
			dig1_p2         : in std_logic_vector(3 downto 0)
		);
	end component;
	----------------------------------------------
	-- INSTANTIATE COUNTER COMPONENT
	----------------------------------------------
	component battlefront_ww2_counter
		port (
          clk, reset              : in std_logic;
          dp1_inc, dp2_inc, d_clr : in std_logic;
          dig0_p1, dig1_p1        : out std_logic_vector (3 downto 0);
          dig0_p2, dig1_p2        : out std_logic_vector (3 downto 0)
		);
	end component;
begin
	----------------------------------------------
	-- TEXT MODULE
	----------------------------------------------	
	battlefront_ww2_text_unit : battlefront_ww2_text
	port map(
		clk      => clock, 
		reset    => reset, 
		pixel_x  => pixel_x, 
		pixel_y  => pixel_y, 
		text_on  => text_on, 
		text_rgb => text_rgb,
		dig0_p1  => dig0_p1,
		dig1_p1  => dig1_p1,
		dig0_p2  => dig0_p2,
		dig1_p2  => dig1_p2
	);
	----------------------------------------------
	-- DIGIT COUNTER MODULE
	----------------------------------------------
	battlefront_ww2_counter_unit : battlefront_ww2_counter
	port map(
		clk      => clock, 
		reset    => reset, 
		dp1_inc  => dp1_inc, 
		dp2_inc  => dp2_inc, 
		d_clr    => d_clr, 
		dig0_p1  => dig0_p1, 
		dig1_p1  => dig1_p1, 
		dig0_p2  => dig0_p2, 
		dig1_p2  => dig1_p2
	);
	----------------------------------------------
	-- CLOCK GENERATOR MODULE
	----------------------------------------------
	clock_unit : clk_wiz_0
	port map(
		clk_in1  => clk, 
		reset    => reset, 
		locked   => open, 
		clk_out1 => clock
	);
	----------------------------------------------
	-- VGA SYNC MODULE
	----------------------------------------------
	vga_sync_unit : vga_sync
	port map(
		clk      => clock, 
		reset    => reset, 
		video_on => video_on, 
		p_tick   => pixel_tick, 
		Hsync    => Hsync, 
		Vsync    => Vsync, 
		pixel_x  => pixel_x, 
		pixel_y  => pixel_y
	);
	----------------------------------------------
	-- GRAPH MODULE
	----------------------------------------------
	battlefront_ww2_unit : battlefront_ww2
	port map(
		clk              => clock, 
		reset            => reset, 
		pixel_x          => pixel_x, 
		pixel_y          => pixel_y, 
		video_on         => video_on, 
		btn              => btn, 
		graph_rgb        => graph_rgb, 
		led              => led,
		sw 	  	         => sw,
		gra_still        => gra_still,
		p1_hit_p2_out    => p1_hit_p2,
		p2_hit_p1_out    => p2_hit_p1,
		over 		     => game_over
	);
	----------------------------------------------
	-- REGISTERS & COLOR BUFFER
	----------------------------------------------
	process (clock, reset, pixel_tick, rgb_next, state_next, player_one_lives_next, player_two_lives_next)
	begin
		if reset = '1' then
			state_reg <= newgame;
			player_one_lives_reg <= 3;
			player_two_lives_reg <= 3;
			d_clr <= '0';
		elsif rising_edge(clock) then
			state_reg <= state_next;
			player_one_lives_reg <= player_one_lives_next;
			player_two_lives_reg <= player_two_lives_next;
			if (pixel_tick = '1') then
				rgb_reg <= rgb_next;
			end if;
		end if;
	end process;
	----------------------------------------------
	-- FSMD NEXT-STATE LOGIC
	----------------------------------------------
	process (btn, state_reg, player_one_lives_reg, player_two_lives_reg, p1_hit_p2, p2_hit_p1)
	begin
		gra_still <= '1'; -- Characters and game logic are still
		game_over <= '0';
		dp1_inc <= '0';
		dp2_inc <= '0';
		state_next <= state_reg;
		player_one_lives_next <= player_one_lives_reg;
		player_two_lives_next <= player_two_lives_reg;
		case state_reg is
		    when rules =>
		        if btn(2) = '1' then
 		             state_next <= newgame;
 		        end if;
			when newgame => 
				player_one_lives_next <= 3;
				player_two_lives_next <= 3;
				state_next <= play;
			when play => 
				gra_still <= '0'; 
				if p1_hit_p2 = '1' then
					player_two_lives_next <= player_two_lives_reg - 1;
				elsif p2_hit_p1 = '1' then
					player_one_lives_next <= player_one_lives_reg - 1;
				end if;
				if player_one_lives_reg = 0 then
					state_next <= over;
					game_over <= '1';
					dp2_inc <= '1';
				elsif player_two_lives_reg = 0 then
					state_next <= over;
					game_over <= '1';
					dp1_inc <= '1';
				end if;
			when over => 
				if btn(2) = '1' then
					state_next <= newgame;
				end if;
		end case;
   end process;
   ----------------------------------------------
   -- RGB MULTIPLEXING CIRCUIT
   ----------------------------------------------
	process(video_on, graph_rgb, text_on, text_rgb)
	begin
		if video_on='0' then
			rgb_next <= "000000000000"; -- blank the edge/retrace
		else
			if text_on(0) = '1' then
				rgb_next <= text_rgb;
			elsif text_on(1) = '1' then
			    rgb_next <= text_rgb;
			elsif text_on(2) = '1' then
			    rgb_next <= text_rgb;
			else
				rgb_next <= graph_rgb;
			end if;
		end if;
	end process;
   ----------------------------------------------
   -- VIDEO OUTPUT
   ----------------------------------------------
   vgaRed <= rgb_reg(11 downto 8);
   vgaGreen <= rgb_reg(7 downto 4);
   vgaBlue <= rgb_reg(3 downto 0);
end arch;