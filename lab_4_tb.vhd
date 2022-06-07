----------------------------------------------------------------------------------
-- Company: George Mason University - ECE 445 - Computer Organization
-- Engineer: Jordan Carnes
-- Create Date: 07/10/2020
-- Module Name: I-Type Datapath Testbench
-- Project Name: Lab 4 - I-type Datapath
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lab_4_tb is
end lab_4_tb;

architecture Behavioral of lab_4_tb is

component jtype_wrapper is
  port (
    ALUOut : out STD_LOGIC_VECTOR ( 31 downto 0 );
    Carryout_0 : out STD_LOGIC;
    Dout_0 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    Overflow_0 : out STD_LOGIC;
    Zero_0 : out STD_LOGIC;
    clk_0 : in STD_LOGIC;
    reset_0 : in STD_LOGIC
  );
end component jtype_wrapper;

signal ALUout_tb : std_logic_vector (31 downto 0);
signal zero_tb : std_logic;
signal carryout_tb : std_logic;
signal Overflow_tb : std_logic;
signal clk_tb : std_logic;
signal reset_tb : std_logic;
signal PCout_tb : std_logic_vector (4 downto 0);

begin

    uut: jtype_wrapper port map(

        ALUout => ALUout_tb,
        Carryout_0 => Carryout_tb,
        Overflow_0 => Overflow_tb,
        Zero_0 => Zero_tb,
        clk_0 => clk_tb,
        Dout_0 => PCout_tb,
        reset_0 => reset_tb        
        );
    
    simulation : process
    begin
        reset_tb <= '1';
        clk_tb <= '1';
        wait for 10ns;
        clk_tb <= '0';
        wait for 10ns;
        
        reset_tb <='0';
        for i in 0 to 29 loop
            clk_tb <= '1';
            wait for 10ns;
            clk_tb <= '0';
            wait for 10ns;
        end loop;
         
    end process simulation;
    
end Behavioral;