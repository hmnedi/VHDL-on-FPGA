-- Hooman Edraki --
-- First Project --
--  No ChatGPT   --
--    140301     --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity human is
    Port (
        clk      : in  STD_LOGIC;              -- Clock signal
      sw: in std_logic;
      sw_reverse: in std_logic;
      button: in std_logic;						-- **NOTE: default value is 1, pressed value is 0
        segments : out STD_LOGIC_VECTOR(6 downto 0); -- 7-segment output
        anode    : out STD_LOGIC_VECTOR(3 downto 0) -- Anode control for 4 displays
    );
end human;

architecture Behavioral of human is
    
  type state_type is (S0, S1, S2, S3);  -- to multiplex sevensegments
  signal pre_state: state_type := S0;
  signal next_state: state_type;
  signal inner_clk: std_logic := '0';

  signal digit0: STD_LOGIC_VECTOR(6 downto 0) := "1111111";
  signal digit1: STD_LOGIC_VECTOR(6 downto 0) := "1111111";
  signal digit2: STD_LOGIC_VECTOR(6 downto 0) := "1111111";
  signal digit3: STD_LOGIC_VECTOR(6 downto 0) := "1111111";

  signal number: integer := -2;
  
  signal yekan: integer range 0 to 10 := 10; -- 10 is for off
  signal dahgan: integer range 0 to 10 := 10;
  signal sadgan: integer range 0 to 10 := 10;
  signal hezargan: integer range 0 to 10 := 10;
  
  -- Signals for Fibonacci sequence
  signal fib_curr : INTEGER := 0;
  signal fib_prev1 : INTEGER := 1;
  signal fib_prev2 : INTEGER := 0;
   
begin
  process(clk)
  variable clk_counter: integer range 0 to 2500 := 0;
  variable clk_second: integer range 0 to 24000000:= 0;
  variable v_fib_curr, v_fib_prev1, v_fib_prev2: INTEGER; -- Temporary variables, because don't forget hardware are simultaneous
  begin
    if rising_edge(clk) then
      clk_counter := clk_counter + 1;
      clk_second := clk_second + 1;
      
      if clk_counter >= 2500 then
        clk_counter := 0;
        
        inner_clk <= not inner_clk;
      end if;
      
      if clk_second >= 24000000 then -- our clock works on 24MHz so counting to it is one second
        clk_second := 0;
        
        if sw = '1' and button = '1' then -- if button wasn't pressed (lazy button debounce)
          number <= number + 1;
          if number >= 0 then
          
            v_fib_curr := fib_curr;
            v_fib_prev1 := fib_prev1;
            v_fib_prev2 := fib_prev2;
            
            if v_fib_curr >= 144 and sw_reverse = '0' then -- fib overflow
              v_fib_curr := 0;
              v_fib_prev1 := 1;
              v_fib_prev2 := 0;
            elsif fib_curr <= 1 and fib_prev2 = 0 and sw_reverse = '1' then -- fib overflow in reverse
              v_fib_curr := 144;
              v_fib_prev1 := 144;
              v_fib_prev2 := 89;
            else
              if sw_reverse = '0' then -- calculating fib
                v_fib_curr := v_fib_prev1 + v_fib_prev2;
                v_fib_prev2 := v_fib_prev1;
                v_fib_prev1 := v_fib_curr;
              else							-- calculating fib reverse
                v_fib_prev2 := v_fib_prev1 - v_fib_prev2;
                v_fib_curr := v_fib_curr - v_fib_prev2;
                v_fib_prev1 := v_fib_curr;
              end if;
				end if;
				


            fib_curr <= v_fib_curr;
            fib_prev1 <= v_fib_prev1;
            fib_prev2 <= v_fib_prev2;
				
				
				elsif number >= 50000 then number <= 0; -- preventing number from overflow

          end if;
        end if;
      end if;
    end if;
  end process;
  
  process(number, fib_prev2)
  begin
    if number = -2 then
      yekan <= 10; -- Turn OFF 
      dahgan <= 10;
      sadgan <= 10;
      hezargan <= 10;
    elsif number = -1 then
      yekan <= 8;
      dahgan <= 0;
      sadgan <= 1;
      hezargan <= 8; 
    else
      yekan <= fib_prev2 mod 10; -- ragham yekane addad
      dahgan <= (fib_prev2 / 10) mod 10; -- raghame dahgan
      sadgan <= 0;
      hezargan <= 0;
    end if;
  end process;
  
  
  process(yekan)
  begin
    case yekan is 
      when 0 => digit0 <= "1000000"; -- 0
      when 1 => digit0 <= "1111001"; -- 1
      when 2 => digit0 <= "0100100"; -- 2
      when 3 => digit0 <= "0110000"; -- 3
      when 4 => digit0 <= "0011001"; -- 4
      when 5 => digit0 <= "0010010"; -- 5
      when 6 => digit0 <= "0000010"; -- 6
      when 7 => digit0 <= "1111000"; -- 7
      when 8 => digit0 <= "0000000"; -- 8
      when 9 => digit0 <= "0010000"; -- 9
      when others => digit0 <= "1111111";
    end case;
  end process;
  
  process(dahgan)
  begin
    case dahgan is 
      when 0 => digit1 <= "1000000"; -- 0
      when 1 => digit1 <= "1111001"; -- 1
      when 2 => digit1 <= "0100100"; -- 2
      when 3 => digit1 <= "0110000"; -- 3
      when 4 => digit1 <= "0011001"; -- 4
      when 5 => digit1 <= "0010010"; -- 5
      when 6 => digit1 <= "0000010"; -- 6
      when 7 => digit1 <= "1111000"; -- 7
      when 8 => digit1 <= "0000000"; -- 8
      when 9 => digit1 <= "0010000"; -- 9
      when others => digit1 <= "1111111";
    end case;
  end process;
  
  process(sadgan)
  begin
    case sadgan is 
      when 0 => digit2 <= "1000000"; -- 0
      when 1 => digit2 <= "1111001"; -- 1
      when 2 => digit2 <= "0100100"; -- 2
      when 3 => digit2 <= "0110000"; -- 3
      when 4 => digit2 <= "0011001"; -- 4
      when 5 => digit2 <= "0010010"; -- 5
      when 6 => digit2 <= "0000010"; -- 6
      when 7 => digit2 <= "1111000"; -- 7
      when 8 => digit2 <= "0000000"; -- 8
      when 9 => digit2 <= "0010000"; -- 9
      when others => digit2 <= "1111111";
    end case;
  end process;


  process(hezargan)
  begin
    case hezargan is 
      when 0 => digit3 <= "1000000"; -- 0
      when 1 => digit3 <= "1111001"; -- 1
      when 2 => digit3 <= "0100100"; -- 2
      when 3 => digit3 <= "0110000"; -- 3
      when 4 => digit3 <= "0011001"; -- 4
      when 5 => digit3 <= "0010010"; -- 5
      when 6 => digit3 <= "0000010"; -- 6
      when 7 => digit3 <= "1111000"; -- 7
      when 8 => digit3 <= "0000000"; -- 8
      when 9 => digit3 <= "0010000"; -- 9
      when others => digit3 <= "1111111";
    end case;
  end process;


  process(inner_clk)
  begin
    if rising_edge(inner_clk) then
      pre_state <= next_state;
    end if;
  end process;
  
  
  process(pre_state, digit0, digit1, digit2, digit3)
  begin
    case pre_state is
      when S0 => anode <= "0111"; segments <= digit0; next_state <= S1; 
      when S1 => anode <= "1011"; segments <= digit1; next_state <= S2;
      when S2 => anode <= "1101"; segments <= digit2; next_state <= S3;
      when S3 => anode <= "1110"; segments <= digit3; next_state <= S0;
      when others => anode <= "1111"; segments <= "1111111"; next_state <= S0;
    end case;
  end process;

  
end Behavioral;
