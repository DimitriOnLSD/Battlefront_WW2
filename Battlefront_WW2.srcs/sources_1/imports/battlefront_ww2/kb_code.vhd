-- Listing 8.3
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity kb_code is
   generic(W_SIZE: integer:=2);  -- 2^W_SIZE words in FIFO
   port (
      clk, reset: in  std_logic;
      ps2d, ps2c: in  std_logic;
      rd_key_code: in std_logic;
      key_code: out std_logic_vector(7 downto 0);
      rx_done_tick: out std_logic;
      kb_buf_empty: out std_logic
   );
end kb_code;

architecture arch of kb_code is
   constant BRK: std_logic_vector(7 downto 0):="11110000";
   -- F0 (break code)
   type statetype is (wait_brk, get_code);
   signal state_reg, state_next: statetype;
   signal scan_out: std_logic_vector(7 downto 0);
   signal scan_done_tick, got_code_tick: std_logic;
   
	begin
   --=======================================================
   -- instantiation
   --=======================================================
	key_code <= scan_out;
   ps2_rx_unit: entity work.ps2_rx(arch)
      port map(clk=>clk, reset=>reset, rx_en=>'1',
               ps2d=>ps2d, ps2c=>ps2c,
               rx_done_tick=>scan_done_tick,
               dout=>scan_out);

   --=======================================================
   -- FSM to get the scan code after F0 received
   --=======================================================
   process (clk, reset)
   begin
      if reset='1' then
         state_reg <= wait_brk;
      elsif (clk'event and clk='1') then
         state_reg <= state_next;
      end if;
   end process;

   rx_done_tick <= '1' when scan_done_tick='1' else '0';

   process(state_reg, scan_done_tick, scan_out)
   begin
      got_code_tick <='0';
      state_next <= state_reg;
      case state_reg is
         when wait_brk => -- wait for F0 of break code
            if scan_done_tick='1' and scan_out=BRK then
               state_next <= get_code;
            end if;
         when get_code => -- get the following scan code
            if scan_done_tick='1' then
               got_code_tick <='1';
               state_next <= wait_brk;
            end if;
      end case;
   end process;
end arch;