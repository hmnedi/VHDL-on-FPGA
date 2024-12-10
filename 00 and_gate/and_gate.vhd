library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_gate is
	port(
		A: in std_logic;
		B: in std_logic;
		C: in std_logic;
		Y: out std_logic);
end and_gate;

architecture Behavioral of and_gate is

begin

y <= (A or B) and (not C);


end Behavioral;

