LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY mux_eight_tb IS
END mux_eight_tb;
 
ARCHITECTURE behavior OF mux_eight_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_eight
    PORT(
         S : IN  std_logic_vector(2 downto 0);
         A : IN  std_logic_vector(7 downto 0);
         Y : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal S : std_logic_vector(2 downto 0) := (others => '0');
   signal A : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal Y : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux_eight PORT MAP (
          S => S,
          A => A,
          Y => Y
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		A <= "01010101";
      S <= "000";
		wait for 100 ns;
		
      S <= "001";
		wait for 100 ns;


      S <= "010";
		wait for 100 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
