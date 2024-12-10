----------------------------------------------------------------------------------
-- 
-- Engineer: Hooman Edraki
-- Create Date:    19:38:23 11/08/2024 
-- Project Name: mux4:1 with mux2:1 and components
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4 is
	port (
		s: in std_logic_vector(1 downto 0);
		A: in std_logic_vector(3 downto 0);
		Y: out std_logic
	);
end mux4;

architecture Behavioral of mux4 is
	Signal yA, yB: std_logic;

	component mux2
		port (
			s: in std_logic;
			A: in std_logic_vector(1 downto 0);
			Y: out std_logic
		);
	end component;

begin
	mux2_a: mux2
		port map (
			s => s(0),
			A => A(1 downto 0),
			Y => yA
		);

	mux2_b: mux2
		port map (
			s => s(0),
			A => A(3 downto 2),
			Y => yB
		);

	mux2_c: mux2
		port map (
			s => s(1),
			A(0) => yA,
			A(1) => yB,
			Y => Y
		);

end Behavioral;

