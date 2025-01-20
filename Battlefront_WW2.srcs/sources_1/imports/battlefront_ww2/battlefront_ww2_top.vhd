library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity battlefront_ww2_top is
    generic(W_SIZE: integer:=2);
	port (
		clk, reset    : in std_logic;
		Hsync, Vsync  : out std_logic;
		ps2d, ps2c    : in  std_logic;
		btn           : in std_logic_vector (3 downto 0);
		sw            : in std_logic_vector (3 downto 0);
		vgaRed        : out std_logic_vector(3 downto 0);
		vgaGreen      : out std_logic_vector(3 downto 0);
		vgaBlue       : out std_logic_vector(3 downto 0)
	);
end battlefront_ww2_top;

architecture arch of battlefront_ww2_top is
	constant BRK: std_logic_vector(7 downto 0):="11110000";
	type state_type is (rules, newgame, play, over);
	type state_ps2_type is (wait_brk, get_code);
	signal state_reg, state_next                       : state_type;                    -- State register and next state
	signal state_ps2_reg, state_ps2_next               : state_ps2_type;                -- State register and next state for PS/2
	signal player_one_lives_reg, player_one_lives_next : integer range 0 to 3 := 3;     -- Player 1 lives
	signal player_two_lives_reg, player_two_lives_next : integer range 0 to 3 := 3;     -- Player 2 lives
	signal pixel_x, pixel_y                            : std_logic_vector(9 downto 0);  -- Pixel coordinates
	signal video_on, pixel_tick, clock                 : std_logic;                     -- Video, pixel tick, and clock signals
	signal rgb_reg, rgb_next                           : std_logic_vector(11 downto 0); -- RGB color buffer
	signal graph_rgb, text_rgb                         : std_logic_vector(11 downto 0); -- Graph and text RGB colors
	signal winner_reg, winner_next                     : std_logic_vector(1 downto 0);  -- Winner register for game over text
	signal dig0_p1, dig1_p1							   : std_logic_vector(3 downto 0);  -- Player 1 score digit 1 and digit 0 for 2-digit score
	signal dig0_p2, dig1_p2							   : std_logic_vector(3 downto 0);  -- Player 2 score digit 1 and digit 0 for 2-digit score
	signal dp1_inc, dp2_inc, d_clr                     : std_logic;                     -- Increment player 1 score, increment player 2 score, and clear score
	signal p1_hit_p2, p2_hit_p1                        : std_logic;                     -- Player 1 hits player 2, player 2 hits player 1
	signal text_on                                     : std_logic_vector(5 downto 0);  -- Text on/off
	signal gra_still                                   : std_logic;                     -- Graph still. Used to lock characters and game logic when not in play state
	signal display_game_over						   : std_logic;	                    -- Game over flag
	signal display_rules							   : std_logic;						-- Display rules flag
	signal scan_out                                    : std_logic_vector(7 downto 0);
	signal scan_done_tick, got_code_tick               : std_logic; 
	signal keys_pressed: std_logic_vector(255 downto 0) := (others => '0');
	signal clear_key : std_logic;
	signal btn_key			                   : std_logic_vector (7 downto 0);
	signal scan_data, w_data            : std_logic_vector(7 downto 0);
    signal kb_not_empty, kb_buf_empty: std_logic;
    signal key_code, ascii_code   : std_logic_vector(7 downto 0);
    signal released_key : std_logic := '0'; -- Sinal para indicar se uma tecla foi liberada
    signal current_key  : std_logic_vector(7 downto 0) := (others => '0'); -- Última tecla processada
    signal key_state: std_logic_vector(7 downto 0) := (others => '0');
	signal rx_done_tick : std_logic;
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
			btn_key          : in std_logic_vector(7 downto 0);
			video_on         : in std_logic;
			graph_rgb        : out std_logic_vector(11 downto 0);
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
			clk, reset       : in std_logic;
			pixel_x, pixel_y : in std_logic_vector(9 downto 0);
			text_on          : out std_logic_vector(5 downto 0);
			text_rgb         : out std_logic_vector(11 downto 0);
			dig0_p1          : in std_logic_vector(3 downto 0);
			dig1_p1          : in std_logic_vector(3 downto 0);
			dig0_p2          : in std_logic_vector(3 downto 0);
			dig1_p2          : in std_logic_vector(3 downto 0);
			win				 : in std_logic_vector(1 downto 0)
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
	----------------------------------------------
	-- INSTANTIATE PS/2 KB COMPONENT
	----------------------------------------------
	component ps2_kb
		port (
			clk, reset  : in  std_logic;
			ps2d, ps2c  : in  std_logic;
			rd_key_code : in std_logic;
			key_code    : out std_logic_vector(7 downto 0);
			kb_buf_empty: out std_logic;
			rx_done_tick: out std_logic
		);
	end component;
    ----------------------------------------------
	-- INSTANTIATE PS/2 KEY2ASCII COMPONENT
	----------------------------------------------
	component ps2_key2ascii
	   port (
        	key_code: in std_logic_vector(7 downto 0);
        	ascii_code: out std_logic_vector(7 downto 0)
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
		dig1_p2  => dig1_p2,
		win		 => winner_reg
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
		clk           => clock, 
		reset         => reset, 
		pixel_x       => pixel_x, 
		pixel_y       => pixel_y, 
		video_on      => video_on, 
		btn_key       => btn_key, 
		graph_rgb     => graph_rgb, 
		gra_still     => gra_still,
		p1_hit_p2_out => p1_hit_p2,
		p2_hit_p1_out => p2_hit_p1,
		over 		  => display_game_over
	);
	----------------------------------------------
	-- PS/2 KB MODULE
	----------------------------------------------
	kb_code_unit: entity work.kb_code(arch)
	port map(
        clk          => clock, 
        reset        => reset, 
        ps2d         => ps2d, 
        ps2c         => ps2c,   
        rd_key_code  => kb_not_empty, 
        key_code     => key_code,
        kb_buf_empty => kb_buf_empty,
		rx_done_tick => rx_done_tick
    );
    --------------------------------------------
	-- PS/2 KEY2ASCII MODULE
	--------------------------------------------
	key2a_unit: entity work.key2ascii(arch)
	port map(
        key_code   => key_code,
        ascii_code => ascii_code
    );
    --------------------------------------------
    -- KEYBOARD OR BUTTON INPUT WITH DEBUGGING
    --------------------------------------------
    btn_key(7) <= '1' when ascii_code = "00001101" or  sw(3) = '1' else '0'; -- ENTER
    btn_key(6) <= '1' when ascii_code = "01001001" or  sw(2) = '1' else '0'; -- I
    btn_key(5) <= '1' when ascii_code = "01001100" or  sw(1) = '1' else '0'; -- J
    btn_key(4) <= '1' when ascii_code = "01001010" or  sw(0) = '1' else '0'; -- L
    btn_key(3) <= '1' when ascii_code = "00100000" or btn(3) = '1' else '0'; -- SPACE
    btn_key(2) <= '1' when ascii_code = "01010111" or btn(2) = '1' else '0'; -- W
    btn_key(1) <= '1' when ascii_code = "01000100" or btn(1) = '1' else '0'; -- D
    btn_key(0) <= '1' when ascii_code = "01000001" or btn(0) = '1' else '0'; -- A
	----------------------------------------------
	-- REGISTERS & COLOR BUFFER
	----------------------------------------------
	process (clock, reset, pixel_tick, rgb_next, state_next, player_one_lives_next, player_two_lives_next, winner_next)
	begin
		if reset = '1' then
			state_reg <= rules; -- Start at rules state
			state_ps2_reg <= wait_brk;
			player_one_lives_reg <= 3;
			player_two_lives_reg <= 3;
			winner_reg <= "00";
			d_clr <= '0'; -- Clear the score
		elsif rising_edge(clock) then
			state_reg <= state_next;
			state_ps2_reg <= state_ps2_next;
			player_one_lives_reg <= player_one_lives_next;
			player_two_lives_reg <= player_two_lives_next;
			winner_reg <= winner_next;
			if (pixel_tick = '1') then
				rgb_reg <= rgb_next;
			end if;
		end if;
	end process;
	----------------------------------------------
	-- FSMD NEXT-STATE LOGIC
	----------------------------------------------
	process (btn_key, state_reg, player_one_lives_reg, player_two_lives_reg, winner_reg, p1_hit_p2, p2_hit_p1)
	begin
		state_next <= state_reg;
		player_one_lives_next <= player_one_lives_reg;
		player_two_lives_next <= player_two_lives_reg;
		winner_next <= winner_reg;
		gra_still <= '1'; -- Lock characters and game logic
		dp1_inc <= '0'; 
		dp2_inc <= '0'; 
		display_game_over <= '0';
		display_rules <= '0';
		case state_reg is
		    when rules => -- Display rules to the user. When user presses button 2, go to newgame state
				display_rules <= '1'; 
		        if btn_key(3) = '1' then
		             state_next <= newgame;
		        end if;
			when newgame => -- Reset the game and go to play state
				player_one_lives_next <= 3; -- Reset player 1's lives
				player_two_lives_next <= 3; -- Reset player 2's lives
				winner_next <= "00"; -- No winner
				state_next <= play;
			when play => -- Play the game
				gra_still <= '0'; -- Characters and game logic is unlocked
				if p1_hit_p2 = '1' then
					player_two_lives_next <= player_two_lives_reg - 1; -- Decrement player 2's lives when player 1 hits player 2
				elsif p2_hit_p1 = '1' then
					player_one_lives_next <= player_one_lives_reg - 1; -- Decrement player 1's lives when player 2 hits player 1
				end if;
				if player_one_lives_reg = 0 then -- If player 1 has no lives left, player 2 wins
					state_next <= over;
					display_game_over <= '1';
					dp2_inc <= '1'; -- Increment player 2's score
					winner_next <= "10"; -- Player 2 wins
				elsif player_two_lives_reg = 0 then -- If player 2 has no lives left, player 1 wins
					state_next <= over;
					display_game_over <= '1';
					dp1_inc <= '1'; -- Increment player 1's score
					winner_next <= "01"; -- Player 1 wins
				end if;
			when over => -- Display game over screen and who won. When user presses button 2, go to newgame state
				gra_still <= '1'; -- Characters and game logic is locked
				winner_next <= winner_reg;
				display_game_over <= '1'; 
				if btn_key(3) = '1' then
					state_next <= newgame;
				end if;
		end case;
   end process;
	----------------------------------------------
	-- RGB MULTIPLEXING CIRCUIT
	----------------------------------------------
	process(video_on, gra_still, graph_rgb, text_on, text_rgb, display_rules, display_game_over)
	begin
		if video_on='0' then
			rgb_next <= "000000000000";
		else
			if gra_still = '0' then -- Display game
				if text_on(0) = '1' then -- Display score of player 1
					rgb_next <= text_rgb;
				elsif text_on(1) = '1' then -- Display score of player 2
					rgb_next <= text_rgb;
				elsif text_on(2) = '1' then -- Display title
					rgb_next <= text_rgb;
				else
					rgb_next <= graph_rgb;
				end if;
			else -- Display rules and/or game over
				if display_game_over = '1' and text_on(5) = '1' then -- Display game over text
					rgb_next <= text_rgb;
				elsif display_rules = '1' and text_on(4) = '1' then -- Display rules text
					rgb_next <= text_rgb;
				else
					rgb_next <= "000000000000";
				end if;
			end if;
		end if;
	end process;
   ----------------------------------------------
   -- VIDEO OUTPUT
   ----------------------------------------------
   -- Output the RGB values to the VGA pins. Game is currently using all 12 bits of RGB color
   vgaRed   <= rgb_reg(11 downto 8);
   vgaGreen <= rgb_reg( 7 downto 4);
   vgaBlue  <= rgb_reg( 3 downto 0);
end arch;