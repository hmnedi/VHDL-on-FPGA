LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY counters_tb IS
END counters_tb;
 
ARCHITECTURE behavior OF counters_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter
    PORT(
         clk : IN  std_logic;
         Q : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(3 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter PORT MAP (
          clk => clk,
          Q => Q
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
 wait for 50 ns;	
		clk <= '1';

		wait for 50 ns;	
		clk <= '0';
		
		wait for 50 ns;	
		clk <= '1';
		
		wait for 50 ns;	
		clk <= '0';
		
		wait for 50 ns;	
		clk <= '1';

		wait for 50 ns;	
		clk <= '0';
		
		wait for 50 ns;	
		clk <= '1';
		
		wait for 50 ns;	
		clk <= '0';
		
		wait for 50 ns;	
		clk <= '1';

		wait for 50 ns;	
		clk <= '0';
		
		wait for 50 ns;	
		clk <= '1';
		
		wait for 50 ns;	
		clk <= '0';
			
		wait for 50 ns;	
		clk <= '1';

		wait for 50 ns;	
		clk <= '0';
		
		wait for 50 ns;	
		clk <= '1';
		
		wait for 50 ns;	
		clk <= '0';

		wait for 50 ns;	
		clk <= '1';

		wait for 50 ns;	
		clk <= '0';
		
		wait for 50 ns;	
		clk <= '1';
		
		wait for 50 ns;	
		clk <= '0';
		
		wait for 50 ns;	
		clk <= '1';

		wait for 50 ns;	
		clk <= '0';
		
		wait for 50 ns;	
		clk <= '1';
		
		wait for 50 ns;	
		clk <= '0';
		
		wait for 50 ns;	
		clk <= '1';

		wait for 50 ns;	
		clk <= '0';
		
		wait for 50 ns;	
		clk <= '1';
		
		wait for 50 ns;	
		clk <= '0';
		
		wait for 50 ns;	
		clk <= '1';

		wait for 50 ns;	
		clk <= '0';
		
		wait for 50 ns;	
		clk <= '1';
		
		wait for 50 ns;	
		clk <= '0';
		wait for 50 ns;	
		clk <= '1';

		wait for 50 ns;	
		clk <= '0';
		
		wait for 50 ns;	
		clk <= '1';
		
		wait for 50 ns;	
		clk <= '0';
		wait for 50 ns;	
		clk <= '1';

		wait for 50 ns;	
		clk <= '0';
		
		wait for 50 ns;	
		clk <= '1';
		
		wait for 50 ns;	
		clk <= '0';
		wait for 50 ns;	
		clk <= '1';

		wait for 50 ns;	
		clk <= '0';
		
		wait for 50 ns;	
		clk <= '1';
		
		wait for 50 ns;	
		clk <= '0';
      -- insert stimulus here 

      wait;
   end process;

END;
