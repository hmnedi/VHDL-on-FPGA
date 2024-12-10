library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_eight is
	port(
		S: in std_logic_vector(2 downto 0);
		A: in std_logic_vector(7 downto 0);
		Y: out std_logic
		);
end mux_eight;

architecture Behavioral of mux_eight is

begin

process(S, A)
begin
	if s="000" then
		Y <= A(0);
	elsif s = "001" then
		Y <= A(1);
	elsif s = "010" then
		Y <= A(2);
	elsif s = "011" then
		Y <= A(3);
	elsif s = "100" then
		Y <= A(4);
	elsif s = "101" then
		Y <= A(5);
	elsif s = "110" then
		Y <= A(6);
	elsif s = "111" then
		Y <= A(7);
	end if;
end process;

end Behavioral;

