
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mashinhalatcounter is
	port(
		clk: in std_logic;
		leds: out std_logic_vector(2 downto 0)
	);
end mashinhalatcounter;

architecture Behavioral of mashinhalatcounter is
	signal clk_counter: natural range 0 to 50000000 := 0;
	type state_type is (S0, S1, S2, S3, S4, S5, S6, S7);
	signal state: state_type;
	signal tmp: std_logic_vector(2 downto 0);

begin

	process(state)
	begin
		case state is
			when S0 => tmp <= "000";
			when S1 => tmp <= "001";
			when S2 => tmp <= "010";
			when S3 => tmp <= "011";
			when S4 => tmp <= "100";
			when S5 => tmp <= "101";
			when S6 => tmp <= "110";
			when S7 => tmp <= "111";
			when others => tmp <= "000";
		end case;
	
		leds <= tmp;
	
	end process;



	process(clk)
	begin
		if rising_edge(clk) then
			clk_counter <= clk_counter + 1;
			
			if clk_counter >= 50000000 then
				clk_counter <= 0;
				
				case state is
					when S0 => state <= S1;
					when S1 => state <= S2;
					when S2 => state <= S3;
					when S3 => state <= S4;
					when S4 => state <= S5;
					when S5 => state <= S6;
					when S6 => state <= S7;
					when S7 => state <= S0;
					when others => state <= S0;
				end case;
				
				
			end if;
		end if;
	end process;



end Behavioral;

