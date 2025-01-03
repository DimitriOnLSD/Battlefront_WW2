library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity battlefront_ww2_text is
	port (
	clk, reset         : in std_logic;
    pixel_x, pixel_y   : in std_logic_vector(9 downto 0);
    text_on            : out std_logic_vector(3 downto 0);
    text_rgb           : out std_logic_vector(11 downto 0);
    dig0_p1, dig1_p1   : in std_logic_vector(3 downto 0);
    dig0_p2, dig1_p2   : in std_logic_vector(3 downto 0)
	);
end battlefront_ww2_text;

architecture Behavioral of battlefront_ww2_text is
	signal pix_x, pix_y : unsigned(9 downto 0);
    signal font_bit : std_logic;
    signal font_word : std_logic_vector(7 downto 0);
	signal rom_addr : std_logic_vector(10 downto 0);
	signal char_addr, char_addr_txt_p1, char_addr_txt_p2, char_addr_scr_one, char_addr_scr_two, char_addr_title, char_addr_o, row_addr_txt_p1, row_addr_txt_p2 : std_logic_vector(6 downto 0);
	signal row_addr, row_addr_s, row_addr_l, row_addr_o : std_logic_vector(3 downto 0);
	signal bit_addr, bit_addr_txt_p1, bit_addr_txt_p2, bit_addr_s, bit_addr_l, bit_addr_o : std_logic_vector(2 downto 0);
	
	
	signal title_on, game_over_txt_on, score_p1_on, score_p2_on: std_logic;
  signal row_addr_small : std_logic_vector(4 downto 1);
  signal bit_addr_small : std_logic_vector(3 downto 1);
begin
  ---------------------------------------------
  -- ADD FONT ROM
  ---------------------------------------------
	pix_x <= unsigned(pixel_x);
	pix_y <= unsigned(pixel_y);
	font_unit : entity work.font_rom
		port map(
			clk => clk, 
			addr => rom_addr, data => font_word
		);
  ---------------------------------------------
  -- GAME NAME "BATTLEFRONT WW2"
  ---------------------------------------------
  title_on <= '1' when pix_y(9 downto 5) = 0 and (250 <= pix_x(9 downto 0) and pix_x(9 downto 0) <= 500) else '0';
  row_addr_small <= std_logic_vector(pix_y(4 downto 1));
  bit_addr_small <= std_logic_vector(pix_x(3 downto 1));
  with pix_x(7 downto 4) select
  char_addr_title <= 
    "1000010" when "0000", -- B (binary of x42)
    "1000001" when "0001", -- A (binary of x41)
    "1010100" when "0010", -- T (binary of x54)
    "1010100" when "0011", -- T (binary of x54)
    "1001100" when "0100", -- L (binary of x4C)
    "1000101" when "0101", -- E (binary of x45)
    "1000110" when "0110", -- F (binary of x46)
    "1010010" when "0111", -- R (binary of x52)
    "1001111" when "1000", -- O (binary of x4F)
    "1001110" when "1001", -- N (binary of x4E)
    "1010100" when "1010", -- T (binary of x54)
    "0111010" when "1011", -- : (binary of x3A)
    "1010111" when "1100", -- W (binary of x57)
    "1010111" when "1101", -- W (binary of x57)
    "0110010" when "1110", -- 2 (binary of x32)
    "0000000" when others;
  ---------------------------------------------
  -- PLAYER 1 TEXT & SCORE
  ---------------------------------------------
  score_p1_on <= '1' when pix_y(9 downto 5) = 14 and (0 <= pix_x(9 downto 5) and pix_x(9 downto 5) <= 6) else '0';
  row_addr_small <= std_logic_vector(pix_y(4 downto 1));
  bit_addr_small <= std_logic_vector(pix_x(3 downto 1));
  with pix_x(7 downto 4) select
  char_addr_txt_p1 <= 
    "1010000"       when "0000", -- P (binary of x50)
    "1001100"       when "0001", -- L (binary of x4C)
    "1000001"       when "0010", -- A (binary of x41)
    "1011001"       when "0011", -- Y (binary of x59)
    "1000101"       when "0100", -- E (binary of x45)
    "1010010"       when "0101", -- R (binary of x42)
    "0000000"       when "0110", --   (binary of x00)
    "0110001"       when "0111", -- 1 (binary of x31)
    "0111010"       when "1000", -- : (binary of x3A)
    "0000000"       when "1001", --   (binary of x00)
    "011" & dig1_p1 when "1010", -- digit 10
    "011" & dig0_p1 when "1011", -- digit 1
    "0000000" when others;
  ---------------------------------------------
  -- PLAYER 2 TEXT & SCORE
  ---------------------------------------------
  score_p2_on <= '1' when pix_y(9 downto 5) = 14 and (7 <= pix_x(9 downto 5) and pix_x(9 downto 5) <= 13) else '0';
  row_addr_small <= std_logic_vector(pix_y(4 downto 1));
  bit_addr_small <= std_logic_vector(pix_x(3 downto 1));
  with pix_x(7 downto 4) select
  char_addr_txt_p2 <= 
    "1010000"       when "0000", -- P (binary of x50)
    "1001100"       when "0001", -- L (binary of x4C)
    "1000001"       when "0010", -- A (binary of x41)
    "1011001"       when "0011", -- Y (binary of x59)
    "1000101"       when "0100", -- E (binary of x45)
    "1010010"       when "0101", -- R (binary of x42)
    "0000000"       when "0110", --   (binary of x00)
    "0110010"       when "0111", -- 2 (binary of x32)
    "0111010"       when "1000", -- : (binary of x3A)
    "0000000"       when "1001", --   (binary of x00)
    "011" & dig1_p2 when "1010", -- digit 10
    "011" & dig0_p2 when "1011", -- digit 1
    "0000000" when others;
  ---------------------------------------------
  -- ROM/RGB ADDRESS MUX
  ---------------------------------------------
  process (
    title_on, score_p1_on, score_p2_on, game_over_txt_on, 
    font_bit, 
    row_addr_small, bit_addr_small,
    char_addr_txt_p1, char_addr_txt_p2, char_addr_title)
	begin
    row_addr <= row_addr_small;
    bit_addr <= bit_addr_small;
    text_rgb <= "000000000000";

    if score_p1_on = '1' then
      char_addr <= char_addr_txt_p1;
      if font_bit = '1' then
        text_rgb <= "111111111111";
      end if;
    elsif score_p2_on = '1' then
      char_addr <= char_addr_txt_p2;
      if font_bit = '1' then
        text_rgb <= "111111111111";
      end if;
    elsif title_on = '1' then
      char_addr <= char_addr_title;
      if font_bit = '1' then
          text_rgb <= "111111111111";
      end if;
    end if;
	end process;
	text_on <= game_over_txt_on & title_on & score_p2_on & score_p1_on;
	---------------------------------------------
	-- FONT ROM INTERFACE
	---------------------------------------------
	rom_addr <= char_addr & row_addr;
	font_bit <= font_word(to_integer(unsigned(not bit_addr)));

end Behavioral;