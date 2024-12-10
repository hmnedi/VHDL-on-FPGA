----------------------------------------------------------------------------------
-- 
-- Engineer: Hooman Edraki
-- Create Date:    10:07:36 12/04/2024 
-- Project Name: shift register with generic and load signal
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shiftregister is
	 generic (
        data_width: integer := 8
    );
	 port (
		clk: in std_logic;
		load: in std_logic;
		clear: in std_logic;
		shift_enable: in std_logic;
		serial_input: in std_logic;
		load_data_input: in std_logic_vector(data_width-1 downto 0);
		output_bits: out std_logic_vector(data_width-1 downto 0)
	 );
end shiftregister;

architecture Behavioral of shiftregister is
	signal shift_reg : std_logic_vector(data_width-1 downto 0) := (others => '0'); -- setting everything to zero like "0000000"
	
begin
	process(clk, clear)
	begin
		if clear = '1' then
			shift_reg <= (others => '0'); -- "0000...0"
			
		elsif rising_edge(clk) then
			if load = '1' then
				 shift_reg <= load_data_input;  -- load data
			elsif shift_enable = '1' then
				 shift_reg <= serial_input & shift_reg(data_width-1 downto 1);  -- shift using concatenation
			end if;
		end if;
	end process;
	output_bits <= shift_reg;

end Behavioral;

