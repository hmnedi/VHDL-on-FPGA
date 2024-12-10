LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY comparetor_tb IS
END comparetor_tb;
 
ARCHITECTURE behavior OF comparetor_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT comparator
    PORT(
         A : IN  std_logic_vector(1 downto 0);
         B : IN  std_logic_vector(1 downto 0);
         equal : OUT  std_logic;
         AlowerB : OUT  std_logic;
         AbiggerB : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(1 downto 0) := (others => '0');
   signal B : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal equal : std_logic;
   signal AlowerB : std_logic;
   signal AbiggerB : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: comparator PORT MAP (
          A => A,
          B => B,
          equal => equal,
          AlowerB => AlowerB,
          AbiggerB => AbiggerB
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

 
		A <= "10";
		B <= "11";
		wait for 100 ns;	

      A <= "11";
		B <= "11";
		wait for 100 ns;	

		A <= "10";
		B <= "00";
		wait for 100 ns;	

      -- insert stimulus here 

      wait;
   end process;

END;
