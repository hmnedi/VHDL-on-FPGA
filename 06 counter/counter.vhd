library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity counter is
	port(
		clk: in std_logic;
		Q: out std_logic_vector(3 downto 0)
		);

end counter;

architecture Behavioral of counter is
Signal tmp: std_logic_vector(3 downto 0) := "0000";

begin


process(clk)
begin
	if rising_edge(clk) then -- if (clk='1' and clk'Event) then --
		tmp <= tmp + 1; -- using std_logic_unsigned library --
	end if;
	Q <= tmp;

end process;
end Behavioral;

