
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY round_robin_tb IS
END round_robin_tb;
 
ARCHITECTURE behavior OF round_robin_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT R_R
    PORT(
         clk : IN  std_logic;
         din1 : IN  std_logic_vector(7 downto 0);
         din2 : IN  std_logic_vector(7 downto 0);
         din3 : IN  std_logic_vector(7 downto 0);
         din4 : IN  std_logic_vector(7 downto 0);
         dout : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal din1 : std_logic_vector(7 downto 0) := (others => '0');
   signal din2 : std_logic_vector(7 downto 0) := (others => '0');
   signal din3 : std_logic_vector(7 downto 0) := (others => '0');
   signal din4 : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal dout : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: R_R PORT MAP (
          clk => clk,
          din1 => din1,
          din2 => din2,
          din3 => din3,
          din4 => din4,
          dout => dout
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      
		din1<="11111111";
		din2<="10101010";
		din3<="01010101";
		din4<="00000000";


      wait for clk_period*4;
		
		din1<="10000001";


      wait;
   end process;

END;
