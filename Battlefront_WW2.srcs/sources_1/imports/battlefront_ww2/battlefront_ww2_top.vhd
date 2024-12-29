library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity battlefront_ww2_top is
   port (
      clk, reset: in std_logic;
      Hsync, Vsync: out std_logic;
      btn: in std_logic_vector (3 downto 0);
      vgaRed: out std_logic_vector(3 downto 0);
      vgaGreen: out std_logic_vector(3 downto 0);
      vgaBlue: out std_logic_vector(3 downto 0);
      led : out std_logic_vector(15 downto 0)
   );
end battlefront_ww2_top;

architecture arch of battlefront_ww2_top is
   signal pixel_x, pixel_y: std_logic_vector(9 downto 0);
   signal video_on, pixel_tick, clock: std_logic;
   signal rgb_reg, rgb_next: std_logic_vector(11 downto 0);

   component clk_wiz_0
      port (
         clk_in1: in std_logic;
         reset: in std_logic;
         locked: out std_logic;
         clk_out1: out std_logic
      );
   end component;

   component vga_sync
      port (
         clk: in std_logic;
         reset: in std_logic;
         video_on: out std_logic;
         p_tick: out std_logic;
         Hsync: out std_logic;
         Vsync: out std_logic;
         pixel_x: out std_logic_vector(9 downto 0);
         pixel_y: out std_logic_vector(9 downto 0)
      );
   end component;

   component battlefront_ww2
      port (
         clk, reset: in std_logic;
         pixel_x, pixel_y: in std_logic_vector(9 downto 0);
         btn: in std_logic_vector(3 downto 0);
         video_on: in std_logic;
         graph_rgb: out std_logic_vector(11 downto 0);
         led : out std_logic_vector(15 downto 0)
      );
   end component;

begin
   -- Clock generator
   clock_unit: clk_wiz_0
      port map (
         clk_in1 => clk,
         reset => reset,
         locked => open,
         clk_out1 => clock
      );

   -- VGA Sync
   vga_sync_unit: vga_sync
      port map (
         clk => clock,
         reset => reset,
         video_on => video_on,
         p_tick => pixel_tick,
         Hsync => Hsync,
         Vsync => Vsync,
         pixel_x => pixel_x,
         pixel_y => pixel_y
      );

   -- Gráfico
   battelfront_ww2_unit: battlefront_ww2
      port map (
         clk => clock,
         reset => reset,
         pixel_x => pixel_x,
         pixel_y => pixel_y,
         video_on => video_on,
         btn => btn,
         graph_rgb => rgb_next,
         led => led
      );

   -- Buffer de cor
   process (clock)
   begin
      if rising_edge(clock) then
         if pixel_tick = '1' then
            rgb_reg <= rgb_next;
         end if;
      end if;
   end process;

   vgaRed <= rgb_reg(11 downto 8);
   vgaGreen <= rgb_reg(7 downto 4);
   vgaBlue <= rgb_reg(3 downto 0);

end arch;
