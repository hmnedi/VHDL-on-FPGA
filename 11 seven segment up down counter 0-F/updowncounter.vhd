library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity updowncounter is
	port(
		upcounter: in std_logic;
		clk: in std_logic;
		sevenseg: out std_logic_vector(6 downto 0);
		section: out std_logic_vector(3 downto 0)
	);
end updowncounter;

architecture Behavioral of updowncounter is
signal counter: natural range 0 to 15 := 0;
signal clk_counter: natural range 0 to 50000000 := 0;
signal tmp: std_logic_vector(6 downto 0);

begin

process(counter)
	begin
		case counter is
			when 0 => tmp <= "1000000"; -- 0
			when 1 => tmp <= "1111001"; -- 1
			when 2 => tmp <= "0100100"; -- 2
			when 3 => tmp <= "0110000"; -- 3
			when 4 => tmp <= "0011001"; -- 4
			when 5 => tmp <= "0010010"; -- 5
			when 6 => tmp <= "0000010"; -- 6
			when 7 => tmp <= "1111000"; -- 72
			when 8 => tmp <= "0000000"; -- 8
			when 9 => tmp <= "0010000"; -- 9
			when 10 => tmp <= "0001000"; -- A
			when 11 => tmp <= "0000011"; -- B
			when 12 => tmp <= "1000110"; -- C
			when 13 => tmp <= "0100001"; -- D
			when 14 => tmp <= "0000110"; -- E
			when 15 => tmp <= "0001110"; -- F
			when others => tmp <= "1111111"; -- All segments off
		end case;
		
		sevenseg <= tmp;
		section <= "1110"; -- to turn on just the first 7-segment
	
	end process;


	process(clk)
	begin
		if rising_edge(clk) then
			clk_counter <= clk_counter + 1;
			
			if clk_counter >= 50000000 then
				clk_counter <= 0;
				
				
				
				if upcounter = '0' then
					if counter > 15 then
						counter <= 0;
					else
						counter <= counter + 1;
					end if;
				else
					if counter <= 0 then
						counter <= 15;
					else
						counter <= counter - 1;
					end if;
				end if;
				

			end if;
		end if;
	end process;
	
	

end Behavioral;

