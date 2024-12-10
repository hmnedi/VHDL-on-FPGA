library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_std.ALL;

entity four_bit_multiplier is
	port(
		A: in std_logic_vector(3 downto 0);
		B: in std_logic_vector(3 downto 0);
		Y: out std_logic_vector(7 downto 0)
		);
end four_bit_multiplier;

architecture Behavioral of four_bit_multiplier is

begin

y <= std_logic_vector(unsigned(A) * unsigned(B));

end Behavioral;

