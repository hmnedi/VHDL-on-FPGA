library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity machinestate_4sevesn_segment is
	port(
		clk: in std_logic;
		enable: out std_logic_vector(3 downto 0);
		sevenseg: out std_logic_vector(6 downto 0)
	);
end machinestate_4sevesn_segment;

architecture Behavioral of machinestate_4sevesn_segment is
	type state_type is (S0, S1, S2, S3);  -- ABBA
	signal pre_state: state_type := S0;
	signal next_state: state_type;
	signal inner_clk: std_logic := '0';
begin

	process(clk)
	variable clk_counter: integer range 0 to 2500 := 0;
	begin
		if rising_edge(clk) then
			clk_counter := clk_counter + 1;
			
			if clk_counter >= 2500 then
				clk_counter := 0;
				
				inner_clk <= not inner_clk;
				
			end if;
		end if;
	end process;
	
	
	process(inner_clk)
	begin
		if rising_edge(inner_clk) then
			pre_state <= next_state;
		end if;
	end process;
	
	
	process(pre_state)
	begin
		case pre_state is
			when S0 => enable <= "0111"; sevenseg <= "0001000"; next_state <= S1;
			when S1 => enable <= "1011"; sevenseg <= "0000011"; next_state <= S2;
			when S2 => enable <= "1101"; sevenseg <= "0000011"; next_state <= S3;
			when S3 => enable <= "1110"; sevenseg <= "0001000"; next_state <= S0;
			when others => enable <= "1111"; sevenseg <= "1111111"; next_state <= S0;
		end case;
	end process;
	


end Behavioral;

