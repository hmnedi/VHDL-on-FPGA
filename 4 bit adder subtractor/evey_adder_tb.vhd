
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY evey_adder_tb IS
END evey_adder_tb;
 
ARCHITECTURE behavior OF evey_adder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT everyadder
    PORT(
         OP : IN  std_logic;
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         R : OUT  std_logic_vector(3 downto 0);
         overflow : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal OP : std_logic := '0';
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal R : std_logic_vector(3 downto 0);
   signal overflow : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: everyadder PORT MAP (
          OP => OP,
          A => A,
          B => B,
          R => R,
          overflow => overflow
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		-- addition --
		A <= "0001";
		B <= "0010";
		OP <= '0';
		wait for 100 ns;	
		
		
		A <= "0001";
		B <= "1010";
		OP <= '0';
		wait for 100 ns;	
		
		
		A <= "1111";
		B <= "0000";
		OP <= '0';
		wait for 100 ns;		
		
		
		A <= "1110";
		B <= "0001";
		OP <= '0';
		wait for 100 ns;	
		
		
		-- subtraction --
		A <= "0101";
		B <= "0010";
		OP <= '1';
		wait for 100 ns;	
		
		
		A <= "0001";
		B <= "1010";
		OP <= '1';
		wait for 100 ns;	
		
		
		-- overflow with in addition --
		A <= "0111";
		B <= "0001";
		OP <= '0';
		wait for 100 ns;	
		
		
		A <= "1000";
		B <= "1000";
		OP <= '0';
		wait for 100 ns;	
		
		
		-- overflow in subtraction --
		A <= "0111";
		B <= "1111";
		OP <= '1';
		wait for 100 ns;
		

      wait;
   end process;

END;
