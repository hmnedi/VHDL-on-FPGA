library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2 is
	port(
		s: in std_logic;
		A: in std_logic_vector(1 downto 0);
		Y: out std_logic
	);
end mux2;

architecture Behavioral of mux2 is

begin
	process(s, A)
	begin
		if s = '0' then
			Y <= A(0);
		elsif s = '1' then
			Y <= A(1);
		end if;
	end process;
end Behavioral;

