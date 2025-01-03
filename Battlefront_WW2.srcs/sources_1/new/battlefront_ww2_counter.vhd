library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity battlefront_ww2_counter is
   port(
      clk, reset              : in std_logic;
      dp1_inc, dp2_inc, d_clr : in std_logic;
      dig0_p1, dig1_p1        : out std_logic_vector (3 downto 0);
      dig0_p2, dig1_p2        : out std_logic_vector (3 downto 0)
   );
end battlefront_ww2_counter;

architecture arch of battlefront_ww2_counter is
   signal dig0_p1_reg , dig1_p1_reg: unsigned(3 downto 0);
   signal dig0_p1_next, dig1_p1_next: unsigned(3 downto 0);
   signal dig0_p2_reg , dig1_p2_reg: unsigned(3 downto 0);
   signal dig0_p2_next, dig1_p2_next: unsigned(3 downto 0);
begin
	----------------------------------------------
	-- REGISTERS
	----------------------------------------------
   process (clk, reset, dig0_p1_next, dig1_p1_next, dig0_p2_next, dig1_p2_next)
   begin
      if reset='1' then
         dig1_p1_reg <= (others=>'0');
         dig0_p1_reg <= (others=>'0');
         dig1_p2_reg <= (others=>'0');
         dig0_p2_reg <= (others=>'0');
      elsif (clk'event and clk='1') then
         dig1_p1_reg <= dig1_p1_next;
         dig0_p1_reg <= dig0_p1_next;
         dig1_p2_reg <= dig1_p2_next;
         dig0_p2_reg <= dig0_p2_next;
      end if;
   end process;
	----------------------------------------------
	-- NEXT STATE LOGIC FOR DIGIT COUNTER
	----------------------------------------------
   process(d_clr, 
   dp1_inc, dp2_inc, 
   dig1_p1_reg, dig0_p1_reg, 
   dig1_p2_reg, dig0_p2_reg)
   begin
      dig0_p1_next <= dig0_p1_reg;
      dig1_p1_next <= dig1_p1_reg;
      dig0_p2_next <= dig0_p2_reg;
      dig1_p2_next <= dig1_p2_reg;
      if (d_clr='1') then
         dig0_p1_next <= (others=>'0');
         dig1_p1_next <= (others=>'0');
         dig0_p2_next <= (others=>'0');
         dig1_p2_next <= (others=>'0');
      elsif (dp1_inc='1') then
         if dig0_p1_reg=9 then
            dig0_p1_next <= (others=>'0');
            if dig1_p1_reg=9 then -- 10th digit
               dig1_p1_next <= (others=>'0');
            else
               dig1_p1_next <= dig1_p1_reg + 1;
            end if;
         else
            dig0_p1_next <= dig0_p1_reg + 1;
         end if;
      elsif (dp2_inc='1') then
         if dig0_p2_reg=9 then
            dig0_p2_next <= (others=>'0');
            if dig1_p2_reg=9 then -- 10th digit
               dig1_p2_next <= (others=>'0');
            else
               dig1_p2_next <= dig1_p2_reg + 1;
            end if;
         else
            dig0_p2_next <= dig0_p2_reg + 1;
         end if;
      end if;
   end process;
   dig0_p1 <= std_logic_vector(dig0_p1_reg);
   dig1_p1 <= std_logic_vector(dig1_p1_reg);
   dig0_p2 <= std_logic_vector(dig0_p2_reg);
   dig1_p2 <= std_logic_vector(dig1_p2_reg);
end arch;
