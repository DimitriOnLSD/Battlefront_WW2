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
	type state_type is (newgame, play, over);
	signal state_reg, state_next                       : state_type; 
	signal player_one_lives_reg, player_one_lives_next : integer range 0 to 3 := 3;
	signal player_two_lives_reg, player_two_lives_next : integer range 0 to 3 := 3;
	signal pixel_x, pixel_y                            : std_logic_vector(9 downto 0);
	signal video_on, pixel_tick, clock                 : std_logic;
	signal rgb_reg, rgb_next                           : std_logic_vector(11 downto 0);
	signal p1_hit_p2, p2_hit_p1                        : std_logic;
	signal text_on                                     : std_logic_vector(11 downto 0);

	component clk_wiz_0
		port (
			clk_in1  : in std_logic;
			reset    : in std_logic;
			locked   : out std_logic;
			clk_out1 : out std_logic
		);
	end component;

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

	component battlefront_ww2
		port (
			clk, reset       : in std_logic;
			pixel_x, pixel_y : in std_logic_vector(9 downto 0);
			btn              : in std_logic_vector(3 downto 0);
			video_on         : in std_logic;
			graph_rgb        : out std_logic_vector(11 downto 0);
			led              : out std_logic_vector(15 downto 0);
			sw 				 : in std_logic_vector(3 downto 0)
		);
	end component;

begin
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
	battelfront_ww2_unit : battlefront_ww2
	port map(
		clk       => clock, 
		reset     => reset, 
		pixel_x   => pixel_x, 
		pixel_y   => pixel_y, 
		video_on  => video_on, 
		btn       => btn, 
		graph_rgb => rgb_next, 
		led       => led,
		sw 	  	  => sw
	);
	----------------------------------------------
	-- REGISTERS & COLOR BUFFER
	----------------------------------------------
	process (clock, reset)
	begin
		if reset = '1' then
			state_reg <= newgame;
--			player_one_lives_reg <= 3;
--			player_two_lives_reg <= 3;
		elsif rising_edge(clock) then
			state_reg <= state_next;
--			player_one_lives_reg <= player_one_lives_next;
--			player_two_lives_reg <= player_two_lives_next;
			if (pixel_tick = '1') then
				rgb_reg <= rgb_next;
			end if;
		end if;
	end process;
	----------------------------------------------
	-- FSMD NEXT-STATE LOGIC
	----------------------------------------------
	-- process (btn, char_hit, mummy_hit, timer_up, state_reg, lives_reg)
   -- begin
   --    gra_still <= '1';
   --    timer_start <= '0';
   --    d_inc <= '0';
   --    game_over <= '0';

   --    state_next <= state_reg;
   --    lives_next <= lives_reg;
   --    player_one_lives_next <= player_one_lives_reg;
   --    player_two_lives_next <= player_two_lives_reg;

   --    case state_reg is
   --       when newgame => 
   --          player_one_lives_next <= 3;
   --          player_two_lives_next <= 3;
   --          if btn(2) = '1' then
   --             state_next <= play;
   --          end if;
   --       when play => 
   --          gra_still <= '0'; 

   --          if p1_hit_p2 = '1' then
   --             player_two_lives_next <= player_two_lives_reg - 1;
   --          elsif p2_hit_p1 = '1' then
   --             player_one_lives_next <= player_one_lives_reg - 1;
   --          end if;

   --          if (player_one_lives_reg = 0) then
   --             state_next <= over;
   --             game_over <= '1';
   --             timer_start <= '1'; 
   --             winner <= "01";
   --          elsif (player_two_lives_reg = 0) then
   --             state_next <= over;
   --             game_over <= '1';
   --             timer_start <= '1'; 
   --             winner <= "10";
   --          end if;
   --       when over => 
   --          -- wait for 2 sec to display game over
   --          if timer_up = '1' and btn(2) = '1' then
   --             state_next <= newgame;
   --          end if;
   --    end case;
   -- end process;
   ----------------------------------------------
   -- VIDEO OUTPUT
   ----------------------------------------------
   vgaRed <= rgb_reg(11 downto 8);
   vgaGreen <= rgb_reg(7 downto 4);
   vgaBlue <= rgb_reg(3 downto 0);
end arch;