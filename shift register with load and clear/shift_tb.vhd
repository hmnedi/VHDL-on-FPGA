LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY shift_tb IS
END shift_tb;
 
ARCHITECTURE behavior OF shift_tb IS 
 
 
	constant data_width: integer := 5; -- You can change this value for different widths
 
    COMPONENT shiftregister
	 generic ( 
		data_width: integer
		);
    PORT(
         clk : IN  std_logic;
         load : IN  std_logic;
         clear : IN  std_logic;
         shift_enable : IN  std_logic;
         serial_input : IN  std_logic;
         load_data_input : IN  std_logic_vector(data_width-1 downto 0);
         output_bits : OUT  std_logic_vector(data_width-1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal load : std_logic := '0';
   signal clear : std_logic := '0';
   signal shift_enable : std_logic := '0';
   signal serial_input : std_logic := '0';
   signal load_data_input : std_logic_vector(data_width-1 downto 0) := (others => '0');

 	--Outputs
   signal output_bits : std_logic_vector(data_width-1 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: shiftregister 
	generic map ( data_width => data_width)
	PORT MAP (
          clk => clk,
          load => load,
          clear => clear,
          shift_enable => shift_enable,
          serial_input => serial_input,
          load_data_input => load_data_input,
          output_bits => output_bits
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 50 ns;	

		clk <= '0';
		load <= '0';
		clear <= '0';
		shift_enable <= '0';
		serial_input <= '0';
		load_data_input <= "10011";
		wait for 50 ns;
		clk <= '1';
		wait for 50 ns;
		clk <= '0';
		load <= '1';
		wait for 50 ns;
		clk <= '1';
		wait for 50 ns;
		clk <= '0';
		load <= '0';
		wait for 50 ns;
		serial_input <= '1';
		shift_enable <= '1';
		clk <= '1';
		wait for 50 ns;
		shift_enable <= '0';
		clk <= '0';
		wait for 50 ns;
		clk <= '1';
		wait for 50 ns;
		clk <= '0';
		wait for 50 ns;
		clk <= '1';
		wait for 50 ns;
		
		


      

      wait;
   end process;

END;
