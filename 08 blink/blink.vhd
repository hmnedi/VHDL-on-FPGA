library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity blink is
	port(
		clk: in std_logic;
		led1: out std_logic
	);
end blink;

architecture Behavioral of blink is
signal clk_counter: natural range 0 to 15000000 := 0;
signal blinker: std_logic := '0';

begin
	process(clk)
	begin
		if rising_edge(clk) then
			clk_counter <= clk_counter + 1;
			
			if clk_counter >= 15000000 then
				blinker <= not blinker;
				clk_counter <= 0;
			end if;
		end if;
	
	led1 <= blinker;
	
	end process;
end Behavioral;

