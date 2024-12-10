library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity jkflip is
	port(
		clk: in std_logic;
		J: in std_logic;
		K: in std_logic;
		Q0, Q1: out std_logic
		);
end jkflip;

architecture Behavioral of jkflip is

Signal tmp: std_logic :='0';

begin

process(clk) -- age madaremoon tarkibi bood J,K midadim be process --
begin
	if rising_edge(clk) then -- if (clk='1' and clk'Event) then --
		if (J='0' and k='0') then
			tmp <= tmp;
		elsif (J='0' and k='1') then
			tmp <= '0';
		elsif (J='1' and k='0') then
			tmp <= '1';
		elsif (J='1' and k='1') then
			tmp <= NOT tmp;
		end if;
	end if;

	Q0 <= tmp;
	Q1 <= NOT tmp;
	

	
end process;

end Behavioral;
