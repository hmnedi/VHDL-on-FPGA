LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY ang_gate_tb IS
END ang_gate_tb;
 
ARCHITECTURE behavior OF ang_gate_tb IS 
  
    COMPONENT and_gate
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         C : IN  std_logic;
         Y : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal C : std_logic := '0';

 	--Outputs
   signal Y : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: and_gate PORT MAP (
          A => A,
          B => B,
          C => C,
          Y => Y
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      A<='0';
		B<='0';
		C<='0';
		
		wait for 100 ns;
		
		A<='1';
		B<='0';
		C<='0';
		
		wait for 100 ns;
		
		A<='0';
		B<='1';
		C<='0';
		
		wait for 100 ns;
		
		A<='1';
		B<='1';
		C<='0';
		
		wait for 100 ns;
		
		A<='0';
		B<='0';
		C<='1';
		
		wait for 100 ns;


      -- insert stimulus here 

      wait;
   end process;

END;
