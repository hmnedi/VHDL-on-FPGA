library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparator is
	port(
		A, B: in std_logic_vector(1 downto 0);
		equal, AlowerB, AbiggerB: out std_logic
		);
end comparator;

architecture Behavioral of comparator is

begin

process(A, B)
begin
	
	if A = B then
		AbiggerB <= '0';    -- A > B --
		equal <= '1';  -- A = B --
		AlowerB <= '0';	 -- A < B --
	
	elsif A < B then
		AbiggerB <= '0';    -- A > B --
		equal <= '0';  -- A = B --
		AlowerB <= '1';	 -- A < B --
		
	elsif A > B then
		AbiggerB <= '1';    -- A > B --
		equal <= '0';  -- A = B --
		AlowerB <= '0';	 -- A < B --
	end if;


end process;


end Behavioral;

