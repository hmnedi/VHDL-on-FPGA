LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY mux4_tb IS
END mux4_tb;
 
ARCHITECTURE behavior OF mux4_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux4
    PORT(
         s : IN  std_logic_vector(1 downto 0);
         A : IN  std_logic_vector(3 downto 0);
         Y : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal s : std_logic_vector(1 downto 0) := (others => '0');
   signal A : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Y : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux4 PORT MAP (
          s => s,
          A => A,
          Y => Y
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
		A <= "1101";
		s <= "00";
		wait for 100 ns;
		
		s <= "01";
		wait for 100 ns;
		
		s <= "10";
		wait for 100 ns;
		
		s <= "11";
		wait for 100 ns;
      wait;
   end process;

END;
