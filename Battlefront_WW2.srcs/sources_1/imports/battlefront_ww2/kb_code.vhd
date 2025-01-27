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
      kb_buf_empty,kb_got_code: out std_logic
   );
end kb_code;

architecture arch of kb_code is
   constant BRK: std_logic_vector(7 downto 0):="11110000";-- F0 (break code)
   type statetype is (get_fake_code, get_code);
   signal state_reg, state_next: statetype;
   signal key_code_reg,key_code_next,scan_out, w_data: std_logic_vector(7 downto 0);
   signal scan_done_tick, got_code_tick: std_logic;
	

begin
   --=======================================================
   -- instantiation
   --=======================================================
   ps2_rx_unit: entity work.ps2_rx(arch)
      port map(clk=>clk, reset=>reset, rx_en=>'1',
               ps2d=>ps2d, ps2c=>ps2c, 
               rx_done_tick=>scan_done_tick,
               dout=>scan_out);

   fifo_key_unit: entity work.fifo(arch)
      generic map(B=>8, W=>W_SIZE)
      port map(clk=>clk, reset=>reset, rd=>rd_key_code,
               wr=>got_code_tick, w_data=>scan_out,
               empty=>kb_buf_empty, full=>open,
               r_data=>open);

   --=======================================================
   -- FSM to get the scan code after F0 received
   --=======================================================
   process (clk, reset)
   begin
      if reset='1' then
         state_reg <= get_code;
			key_code_reg<= (others=>'0');
      elsif (clk'event and clk='1') then
         state_reg <= state_next;
			key_code_reg<=key_code_next;
      end if;
   end process;
	
	process(state_reg, scan_done_tick, scan_out,key_code_reg)
   begin
      got_code_tick <='0';
      state_next <= state_reg;
		key_code_next<=key_code_reg;
      case state_reg is

         when get_code => -- get the following scan code
			
			   if (scan_done_tick='1' and scan_out=BRK )then
				   got_code_tick <='1';
					key_code_next<=scan_out;					
				   state_next <= get_fake_code;
				elsif  (scan_done_tick='1')  then 
					got_code_tick <='1';
					key_code_next<=scan_out;
            end if;
			when get_fake_code=>
				if scan_done_tick='1' then
					got_code_tick <='1';
					key_code_next<="00000000";
					state_next <= get_code;
				end if;
      end case;
   end process;
	key_code<=key_code_reg;

end arch;