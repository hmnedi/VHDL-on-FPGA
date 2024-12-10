library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bcdcounter is
	port(
		BCDin: in std_logic_vector(3 downto 0);
		seven_sag: out std_logic_vector(6 downto 0)
	);
end bcdcounter;

architecture Behavioral of bcdcounter is

begin

	process(BCDin)
	begin 
		if BCDin = "0000" then
			seven_sag <= "1000000";
		elsif BCDin = "0001" then
			seven_sag <= "1111001";
		elsif BCDin = "0010" then
			seven_sag <= "0100100";
		elsif BCDin = "0011" then
			seven_sag <= "0110000";
		elsif BCDin = "0100" then
			seven_sag <= "0011001";
		elsif BCDin = "0101" then
			seven_sag <= "0010010";
		elsif BCDin = "0110" then
			seven_sag <= "0000010";
		elsif BCDin = "0111" then
			seven_sag <= "1111000";
		elsif BCDin = "1000" then
			seven_sag <= "0000000";
		elsif BCDin = "1001" then
			seven_sag <= "0010000";
		else
			seven_sag <= "1111111";
		end if;
	end process;
		
	
end Behavioral;

