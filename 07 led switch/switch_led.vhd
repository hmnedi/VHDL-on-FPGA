library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity switch_led is
	port(
		sw1, sw2: in std_logic;
		led1, led2: out std_logic
	);
end switch_led;

architecture Behavioral of switch_led is

begin

	led1 <= sw1;
	led2 <= not sw2;

end Behavioral;

