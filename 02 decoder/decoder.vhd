library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder is
	port(
		A: in std_logic_vector(1 downto 0);		
		Y: out std_logic_vector(3 downto 0)
		);
end decoder;

architecture Behavioral of decoder is

begin


process(A)
begin
	case A is
	when "00" => Y <= "0001";
	when "01" => Y <= "0010";
	when "10" => Y <= "0011";
	when "11" => Y <= "0100";
	when others => null;
	end case;
	
end process;



end Behavioral;

