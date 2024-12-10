----------------------------------------------------------------------------------
-- 
-- Engineer: Hooman Edraki
-- Project Name: 4-bit Adder and Subtractor
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity everyadder is
	port (
		OP: in std_logic;
		A, B: in std_logic_vector(3 downto 0);
		R: out std_logic_vector(3 downto 0);
		overflow: out std_logic
	);
		
end everyadder;

architecture Behavioral of everyadder is

	signal C: std_logic_vector(3 downto 0);
	
	component FullAdder
		port (
			A: in std_logic;
			B: in std_logic;
			Cin: in std_logic;
			Sum: out std_logic;
			Cout: out std_logic
		);
	end component;



begin
	-- maybe we could've used a for loop? --
	
	FA0: FullAdder
		port map (
			A => A(0),
			B => B(0) xor OP,
			Cin => OP,
			Sum => R(0),
			Cout => C(0)
		);
	
	
	FA1: FullAdder
		port map (
			A => A(1),
			B => B(1) xor OP,
			Cin => C(0),
			Sum => R(1),
			Cout => C(1)
		);
		
		
	FA2: FullAdder
		port map (
			A => A(2),
			B => B(2) xor OP,
			Cin => C(1),
			Sum => R(2),
			Cout => C(2)
		);
		
		
	FA3: FullAdder
		port map (
			A => A(3),
			B => B(3) xor OP,
			Cin => C(2),
			Sum => R(3),
			Cout => C(3)
		);
		
	overflow <= C(3) xor c(2);

end Behavioral;

