LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY jkflip_tb IS
END jkflip_tb;
 
ARCHITECTURE behavior OF jkflip_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT jkflip
    PORT(
         clk : IN  std_logic;
         J : IN  std_logic;
         K : IN  std_logic;
         Q0 : OUT  std_logic;
         Q1 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal J : std_logic := '0';
   signal K : std_logic := '0';

 	--Outputs
   signal Q0 : std_logic;
   signal Q1 : std_logic;

   -- Clock period definitions
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: jkflip PORT MAP (
          clk => clk,
          J => J,
          K => K,
          Q0 => Q0,
          Q1 => Q1
        );
 

   -- Stimulus process
   stim_proc: process
   begin		

		K <= '0';
		J <= '1';
		clk <= '1';
      wait for 100 ns;	

		clk <= '0';
		
		wait for 100 ns;
		
		K <= '1';
		J <= '0';
		clk <= '1';
      wait for 100 ns;	

		clk <= '0';
		
		wait for 100 ns;
		
		K <= '0';
		J <= '0';
		clk <= '1';
      wait for 100 ns;	

		clk <= '0';
		
		wait for 100 ns;
		
		K <= '1';
		J <= '1';
		clk <= '1';
      wait for 100 ns;	

		clk <= '0';




      wait;
   end process;

END;
